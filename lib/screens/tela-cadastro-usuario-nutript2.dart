import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primeiroprojeto/authentication/services/auth_service.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/data-nasc.dart';

class TelaCadastroUsuarioNutricionistaPT2 extends StatefulWidget {
  const TelaCadastroUsuarioNutricionistaPT2({Key? key}) : super(key: key);

  @override
  State<TelaCadastroUsuarioNutricionistaPT2> createState() => _TelaCadastroUsuarioNutricionistaPT2State();
}

class _TelaCadastroUsuarioNutricionistaPT2State extends State<TelaCadastroUsuarioNutricionistaPT2> {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ["Masculino", "Feminino"];

  TextEditingController generoController = TextEditingController();
  TextEditingController dateNascController = TextEditingController();

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
                              'Data de Nascimento',
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
                                  return "O valor da Data de Nascimento deve ser preenchido";
                                }
                                if (value!.isEmpty ||
                                    value.length < 8) {
                                  return "Entre com valor válido";
                                }
                                return null;
                              },
                              style: styleTextFieldPrincipalColor,
                              keyboardType: TextInputType.number,
                              controller: dateNascController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: principalColor, width: 2.5),
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
                                  hintText: 'Digite a sua data de nascimento',
                                  hintStyle: styleTextFieldHint,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: principalColor, width: 2.5),
                                      borderRadius:
                                      BorderRadius.circular(50))),
                              inputFormatters: [
                                DataNascimentoFormatter(),
                                LengthLimitingTextInputFormatter(8),
                              ],
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
                    Navigator.pushNamed(context, '/TelaCadastroUsuarioNutricionistaPT3');
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
