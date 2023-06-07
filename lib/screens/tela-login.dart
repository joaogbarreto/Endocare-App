import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primeiroprojeto/authentication/components/show_snackbar.dart';
import 'package:primeiroprojeto/authentication/services/auth_service.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/imagem_login.svg",
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.35,
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
                                  'Email',
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
                                      return "O valor de e-mail deve ser preenchido";
                                    }
                                    if (!value.contains("@") ||
                                        !value.contains(".") ||
                                        value.length < 4) {
                                      return "O valor do e-mail deve ser válido";
                                    }
                                    return null;
                                  },
                                  style: styleTextFieldPrincipalColor,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
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
                                      hintText: 'Digite o seu Email',
                                      hintStyle: styleTextFieldHint,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: principalColor, width: 2.5),
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
                                  'Senha',
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
                                  obscureText: true,
                                  validator: (String? value) {
                                    if (value == null || value.length < 4) {
                                      return "Insira uma senha válida.";
                                    }
                                    return null;
                                  },
                                  style: styleTextFieldPrincipalColor,
                                  keyboardType: TextInputType.text,
                                  controller: passwordController,
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
                                      hintText: 'Digite a sua senha',
                                      hintStyle: styleTextFieldHint,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: principalColor, width: 2.5),
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
                                  'Confirmar Senha',
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
                                  obscureText: true,
                                  validator: (String? value) {
                                    if (value == null || value.length < 4) {
                                      return "Insira uma confirmação de senha válida.";
                                    }
                                    if (value != passwordController.text) {
                                      return "As senhas devem ser iguais.";
                                    }
                                    return null;
                                  },
                                  style: styleTextFieldPrincipalColor,
                                  keyboardType: TextInputType.text,
                                  controller: passwordConfirmController,
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
                                      hintText: 'Confirme sua senha',
                                      hintStyle: styleTextFieldHint,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: principalColor, width: 2.5),
                                          borderRadius:
                                              BorderRadius.circular(50))
                                  ),
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
                        botaoEnviarClicado();
                      },
                      child: const Text(
                        "ENTRAR",
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
                          onTap: () => Navigator.pushNamed(
                              context, '/TelaCadastroUsuarioPT1'),
                          child: Text(
                            "Não tenho uma conta",
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

  botaoEnviarClicado() {
    String email = emailController.text;
    String senha = passwordController.text;

    if (_formKey.currentState!.validate()) {
        _entrarUsuario(email: email, senha: senha);
        Navigator.pushNamed(context, '/TelaHomePages');
    }
  }

  _entrarUsuario({required String email, required String senha}) {
    authService.entrarUsuario(email: email, senha: senha).then((String? erro) {
      if (erro != null) {
        showSnackBar(context: context, mensagem: erro);
      }
    });
  }
}
