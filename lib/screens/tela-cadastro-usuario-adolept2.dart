import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primeiroprojeto/authentication/services/auth_service.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

class TelaCadastroUsuarioAdolescentePT2 extends StatefulWidget {
  const TelaCadastroUsuarioAdolescentePT2({Key? key}) : super(key: key);

  @override
  State<TelaCadastroUsuarioAdolescentePT2> createState() => _TelaCadastroUsuarioAdolescentePT2State();
}

class _TelaCadastroUsuarioAdolescentePT2State extends State<TelaCadastroUsuarioAdolescentePT2> {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ["Masculino", "Feminino"];

  TextEditingController generoController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  bool isEntrando = true;
  AuthService authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          leading: BackButton(
            color: principalColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/imagem_cadastro_usuariopt2.svg",
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Gênero',
                                    style: TextStyle(
                                        color: principalGray,
                                        fontFamily: "Poppins",
                                        fontSize: 20,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: ValueListenableBuilder(
                                      valueListenable: dropValue,
                                      builder: (BuildContext context,
                                          String value, _) {
                                        return DropdownButtonFormField<String>(
                                          style: TextStyle(color: principalColor),
                                          dropdownColor: Color(0xFFE8E8E8),
                                          isExpanded: true,
                                          hint: Text('Informe seu gênero', style: TextStyle(color: principalColor),),
                                          value: (value.isEmpty) ? null : value,
                                          onChanged: (escolha) => dropValue
                                              .value = escolha.toString(),
                                          items: dropOpcoes
                                              .map((op) => DropdownMenuItem(
                                                  value: op, child: Text(op)))
                                              .toList(),
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: principalColor,
                                                      width: 2.5),
                                                  borderRadius:
                                                  BorderRadius.circular(50)),
                                              errorBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: red, width: 2.5),
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: red, width: 2.5),
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              hintStyle: styleTextFieldHint,
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: principalColor,
                                                      width: 2.5),
                                                  borderRadius:
                                                  BorderRadius.circular(50))),
                                        );
                                      }),
                                )
                              ]),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Peso',
                                  style: TextStyle(
                                      color: principalGray,
                                      fontFamily: "Poppins",
                                      fontSize: 20,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value == null || value == "") {
                                      return "O valor do peso deve ser preenchido";
                                    }
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value!) ||
                                        value.length < 2) {
                                      return "Entre com um peso válido";
                                    }
                                    return null;
                                  },
                                  style: styleTextFieldPrincipalColor,
                                  keyboardType: TextInputType.number,
                                  controller: pesoController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: principalColor,
                                              width: 2.5),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: red, width: 2.5),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: red, width: 2.5),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      hintText: 'Digite o seu peso',
                                      hintStyle: styleTextFieldHint,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: principalColor,
                                              width: 2.5),
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Altura',
                                  style: TextStyle(
                                      color: principalGray,
                                      fontFamily: "Poppins",
                                      fontSize: 20,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  validator: (String? value) {
                                    return null;

                                    // if (value != null && value.isEmpty) {
                                    //   return 'Insira seu Email';
                                    // } else if (value == 'adm' || value == 'ADM') {
                                    //   return null;
                                    // }
                                    // return 'Insira um Email valido';
                                  },
                                  style: styleTextFieldPrincipalColor,
                                  keyboardType: TextInputType.number,
                                  controller: alturaController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: principalColor,
                                              width: 2.5),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: red, width: 2.5),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: red, width: 2.5),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      hintText: 'Digite a sua altura',
                                      hintStyle: styleTextFieldHint,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: principalColor,
                                              width: 2.5),
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: buttonFilledPrimary,
                      onPressed: () {
                        Navigator.pushNamed(context, '/TelaCadastroUsuarioPT3');
                      },
                      child: const Text(
                        "CONTINUAR",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ),
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: principalColor, width: 1.0))),
                        margin: EdgeInsets.only(top: 30),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/TelaLogin'),
                          child: Text(
                            "Já tenho uma conta",
                            style: TextStyle(
                              color: principalColor,
                              decorationColor: principalColor,
                              fontFamily: "Poppins",
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
// botaoEnviarClicado() {
//   String email = emailController.text;
//   String senha = passwordController.text;
//
//   if (_formKey.currentState!.validate()) {
//     if (isEntrando) {
//       _entrarUsuario(email: email, senha: senha);
//     }
//   }
// }
// _entrarUsuario({required String email, required String senha}) {
//   authService.entrarUsuario(email: email, senha: senha).then((String? erro) {
//     if (erro != null) {
//       showSnackBar(context: context, mensagem: erro);
//     }
//   });
// }
}
