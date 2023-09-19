import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:primeiroprojeto/firestore/firestore_glicose/models/alimentos.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:uuid/uuid.dart';

import '../styles/color.dart';

class TelaCadastroAlimentos extends StatefulWidget {
  const TelaCadastroAlimentos({Key? key}) : super(key: key);

  @override
  State<TelaCadastroAlimentos> createState() => _TelaCadastroAlimentosState();
}

class _TelaCadastroAlimentosState extends State<TelaCadastroAlimentos> {


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final dropValueGroup = ValueNotifier('');
  final dropValueGord = ValueNotifier('');
  final dropOpcoesGrupoAlimentar = [
    "Carboidratos",
    "Verduras e Legumes",
    "Frutas",
    "Carnes e Ovos",
    "Leguminosos e Oleoginosos",
    "Óleos e Gorduras",
    "Açucares e Doces"
  ];
  final dropOpcoesTipoGordura = [
    "Saturada",
    "Insaturada",
    "Trans",
  ];

  XFile? comprovante;

  TextEditingController nameAlimentoController = TextEditingController();
  TextEditingController grupoAlimentoController = TextEditingController();
  TextEditingController caloriasController = TextEditingController();
  TextEditingController vitaminasController = TextEditingController();
  TextEditingController carboidratosController = TextEditingController();
  TextEditingController mineraisController = TextEditingController();
  TextEditingController proteinasController = TextEditingController();
  TextEditingController fibrasController = TextEditingController();
  TextEditingController gorduraController = TextEditingController();
  TextEditingController qntdGorduraController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Cadastro do Alimento",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
            ),
          ),
          actions: [
            IconButton(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                onPressed: () {
                  botaoenviarClicado();
                },
                tooltip: "Confirmar cadastro",
                icon: Icon(
                  Icons.check,
                  size: 30,
                  color: principalColor,
                )),
          ],
          foregroundColor: principalColor,
          backgroundColor: Colors.transparent,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32),
                child: Container(
                  height: 150,
                  width: 150,
                  child: Center(
                      child: comprovante != null
                          ? InkWell(
                              onTap: () => selecionarComprovante(),
                              child: Image(
                                image:
                                    Image.file(File(comprovante!.path)).image,
                              ),
                            )
                          : InkWell(
                              onTap: () => selecionarComprovante(),
                              child: Image.asset(
                                'assets/images/imagem_foto.png',
                                scale: 1,
                              ),
                            )),
                ),
              ),
            ), //Image foto
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height*0.62,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value == "") {
                            return "O valor de nome deve ser preenchido";
                          }
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z çÇ]+$').hasMatch(value!) ||
                              value.length < 2) {
                            return "Entre com um nome válido";
                          }
                          return null;
                        },
                        style: styleTextFieldPrincipalColor,
                        keyboardType: TextInputType.name,
                        controller: nameAlimentoController,
                        decoration: InputDecoration(
                          label: Text(
                            "Nome do Alimento",
                            style: styleTextFieldPrincipalColor,
                          ),
                          hintText: 'Nome do Alimento',
                          hintStyle: styleTextFieldHint,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ValueListenableBuilder(
                          valueListenable: dropValueGroup,
                          builder: (BuildContext context, String value, _) {
                            return DropdownButtonFormField<String>(
                              style: styleTextFieldPrincipalColor,
                              dropdownColor: Color(0xFFE8E8E8),
                              isExpanded: true,
                              hint: Text(
                                'Grupo Alimentar',
                                style: styleTextFieldPrincipalColor,
                              ),
                              value: (value.isEmpty) ? null : value,
                              onChanged: (escolha) =>
                                  dropValueGroup.value = escolha.toString(),
                              items: dropOpcoesGrupoAlimentar
                                  .map((op) => DropdownMenuItem(
                                      value: op, child: Text(op)))
                                  .toList(),
                              decoration: InputDecoration(
                                hintStyle: styleTextFieldHint,
                              ),
                            );
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value == "") {
                                  return "O valor do campo deve ser preenchido";
                                }
                                if (value!.isEmpty ||
                                    !RegExp(r"^[0-9 .,]+$").hasMatch(value!) ||
                                    value.length < 1) {
                                  return "Entre com um um valor válido";
                                }
                                return null;
                              },
                              style: styleTextFieldPrincipalColor,
                              keyboardType: TextInputType.number,
                              controller: caloriasController,
                              decoration: InputDecoration(
                                label: Text(
                                  "Calorias",
                                  style: styleTextFieldPrincipalColor,
                                ),
                                hintText: 'Ex: 80 (em kcal)',
                                hintStyle: styleTextFieldHint,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value == "") {
                                  return "O valor do campo deve ser preenchido";
                                }
                                if (value!.isEmpty ||
                                    !RegExp(r'^[0-9 .,]+$').hasMatch(value!) ||
                                    value.length < 1) {
                                  return "Entre com um valor válido";
                                }
                                return null;
                              },
                              style: styleTextFieldPrincipalColor,
                              keyboardType: TextInputType.number,
                              controller: carboidratosController,
                              decoration: InputDecoration(
                                label: Text(
                                  "Carboidratos",
                                  style: styleTextFieldPrincipalColor,
                                ),
                                hintText: 'Ex: 10 (em g)',
                                hintStyle: styleTextFieldHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value == "") {
                                  return "O valor do campo deve ser preenchido";
                                }
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z çÇ,]+$')
                                        .hasMatch(value!) ||
                                    value.length <1) {
                                  return "Entre com um valor válido";
                                }
                                return null;
                              },
                              style: styleTextFieldPrincipalColor,
                              keyboardType: TextInputType.name,
                              controller: vitaminasController,
                              decoration: InputDecoration(
                                label: Text(
                                  "Vitaminas",
                                  style: styleTextFieldPrincipalColor,
                                ),
                                hintText: 'Ex: Vitaminas A, B, C, E',
                                hintStyle: styleTextFieldHint,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value == "") {
                                  return "O valor do campo deve ser preenchido";
                                }
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z çÇ]+$')
                                        .hasMatch(value!) ||
                                    value.length < 1) {
                                  return "Entre com um valor válido";
                                }
                                return null;
                              },
                              style: styleTextFieldPrincipalColor,
                              keyboardType: TextInputType.name,
                              controller: mineraisController,
                              decoration: InputDecoration(
                                label: Text(
                                  "Minerais",
                                  style: styleTextFieldPrincipalColor,
                                ),
                                hintText: 'Ex: Cálcio e Potássio',
                                hintStyle: styleTextFieldHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value == "") {
                            return "O valor do campo deve ser preenchido";
                          }
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9 ,.]+$').hasMatch(value!) ||
                              value.length < 1) {
                            return "Entre com um valor válido";
                          }
                          return null;
                        },
                        style: styleTextFieldPrincipalColor,
                        keyboardType: TextInputType.number,
                        controller: proteinasController,
                        decoration: InputDecoration(
                          label: Text(
                            "Proteinas",
                            style: styleTextFieldPrincipalColor,
                          ),
                          hintText: 'Ex: 1,5 (em g)',
                          hintStyle: styleTextFieldHint,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value == "") {
                            return "O valor do campo deve ser preenchido";
                          }
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9 ,.]+$').hasMatch(value!) ||
                              value.length < 1) {
                            return "Entre com um valor válido";
                          }
                          return null;
                        },
                        style: styleTextFieldPrincipalColor,
                        keyboardType: TextInputType.number,
                        controller: fibrasController,
                        decoration: InputDecoration(
                          label: Text(
                            "Fibras",
                            style: styleTextFieldPrincipalColor,
                          ),
                          hintText: 'Ex: 0,5 (em g)',
                          hintStyle: styleTextFieldHint,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ValueListenableBuilder(
                          valueListenable: dropValueGord,
                          builder: (BuildContext context, String value, _) {
                            return DropdownButtonFormField<String>(
                              style: styleTextFieldPrincipalColor,
                              dropdownColor: Color(0xFFE8E8E8),
                              isExpanded: true,
                              hint: Text(
                                'Gordura',
                                style: styleTextFieldPrincipalColor,
                              ),
                              value: (value.isEmpty) ? null : value,
                              onChanged: (escolha) =>
                                  dropValueGord.value = escolha.toString(),
                              items: dropOpcoesTipoGordura
                                  .map((op) => DropdownMenuItem(
                                      value: op, child: Text(op)))
                                  .toList(),
                              decoration: InputDecoration(
                                hintStyle: styleTextFieldHint,
                              ),
                            );
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value == "") {
                            return "O valor do campo deve ser preenchido";
                          }
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9 ,.]+$').hasMatch(value!) ||
                              value.length < 2) {
                            return "Entre com um valor válido";
                          }
                          return null;
                        },
                        style: styleTextFieldPrincipalColor,
                        keyboardType: TextInputType.number,
                        controller: gorduraController,
                        decoration: InputDecoration(
                          label: Text(
                            "Quantidade de Gordura",
                            style: styleTextFieldPrincipalColor,
                          ),
                          hintText: 'Ex: 20 (em g)',
                          hintStyle: styleTextFieldHint,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  selecionarComprovante() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) setState(() => comprovante = file);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  botaoenviarClicado() {
    if (_formKey.currentState!.validate()) {
      Alimentos alimentos = Alimentos(
        id: const Uuid().v1(),
        nome: nameAlimentoController.value.text,
        grupo: "teste",
        calorias: double.parse(caloriasController.value.text),
        carboidratos: double.parse(carboidratosController.value.text),
        vitaminas: vitaminasController.value.text,
        minerais: mineraisController.value.text,
        proteina: double.parse(proteinasController.value.text),
        fibras: double.parse(fibrasController.value.text),
        gordura: "teste",
        qntdGordura: double.parse(qntdGorduraController.value.text),
      );

      firestore
          .collection("alimentos")
          .doc(alimentos.id)
          .set(alimentos.toMap());
      Navigator.pushNamed(context, '/TelaHomePagesNutricionista');
    }
  }
}
