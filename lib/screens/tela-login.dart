import 'package:flutter_svg/flutter_svg.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/endocare_icons.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width *1,
              height: MediaQuery.of(context).size.height * 1,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/fundo_login.png"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: SvgPicture.asset(
                'assets/fundo_login.svg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topCenter,
              margin: const EdgeInsets.only(top: 30),
              child: Image.asset(
                "assets/logo.png",
                width: 100,
                height: 100,
              ),
            ),
            Column(
              children: [
                Container(height: MediaQuery.of(context).size.height * 0.1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return 'Insira seu Email';
                              } else if (value == 'adm' || value == 'ADM') {
                                return null;
                              }
                              return 'Insira um Email valido';
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            scrollPadding: EdgeInsets.zero,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                                suffixIconColor: principalColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: principalColor, width: 2.5),
                                    borderRadius: BorderRadius.circular(50)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: red, width: 2.5),
                                    borderRadius: BorderRadius.circular(50),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: red, width: 2.5),
                                    borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'E-Mail',
                                hintStyle: styleTextField,
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: principalColor, width: 2.5),
                                    borderRadius: BorderRadius.circular(50))
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return 'Insira seu Email';
                              } else if (value == '123') {
                                return null;
                              }
                              return 'Insira uma Senha valida';
                            },
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            scrollPadding: EdgeInsets.zero,
                            textAlign: TextAlign.justify,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  EndocareIcons.icone_chavesenha,
                                  size: 40,
                                ),
                                suffixIconColor: principalColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: principalColor, width: 2.5),
                                    borderRadius: BorderRadius.circular(50)),
                                hintText: 'Senha',
                                hintStyle: styleTextField,
                                fillColor: Colors.white,
                                filled: true,
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: red, width: 2.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: red, width: 2.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: principalColor, width: 2.5),
                                  borderRadius: BorderRadius.circular(50)),),
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.topEnd,
                          padding: EdgeInsets.only(right: 30),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Esqueceu a senha?",
                              style: styleText,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            style: buttonFilledPrimary,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/TelaHomePages');
                              }
                            },
                            child: const Text(
                              "ENTRAR",
                              style: TextStyle(
                                fontFamily: "InterSemiBold",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      alignment: AlignmentDirectional.bottomCenter,
                      child: const Text(
                        "Não tem uma conta?",
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.white,
                          fontFamily: "SourceSansPro",
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        style: ButtonStyle(
                            alignment: AlignmentDirectional.bottomCenter),
                        onPressed: () {},
                        child: Text(
                          "Cadastre-se",
                          style: styleTextRed,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
