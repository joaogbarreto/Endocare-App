import 'package:flutter_svg/flutter_svg.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/endocare_icons.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

class TelaCadastroUsuario extends StatefulWidget {
  const TelaCadastroUsuario({Key? key}) : super(key: key);

  @override
  State<TelaCadastroUsuario> createState() => _TelaCadastro_UsuarioState();
}

class _TelaCadastro_UsuarioState extends State<TelaCadastroUsuario> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;
  final _formKey = GlobalKey<FormState>();

  get screenWidth => MediaQuery.of(context).size.width;

  get screenHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,

        ),
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            SizedBox(
              width: screenWidth * 1,
              height: screenHeight * 1,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/fundo_login.png"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: SvgPicture.asset(
                'assets/fundo_cadastro.svg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin: EdgeInsets.only(left: 10, top: 50),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 40,
                    color: white,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, top: 150),
              width: screenWidth * 0.8,
              child: const Text(
                "Dados Pessoais",
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Column(children: [
              Container(
                height: screenHeight * 0.5,
              ),
              Container(
                height: screenHeight * 0.5,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.8,
                      child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira um Email';
                            }
                            return 'Insira um Email valido no campo ';
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: styleinputprimary
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: screenWidth * 0.8,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Insira seu Email';
                          } else if (value == 'adm123') {
                            return null;
                          }
                          return 'Insira uma Senha valida';
                        },
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            EndocareIcons.icone_chavesenha,
                            size: 35,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                obscureText = !obscureText;
                              },
                              child: Icon(
                                EndocareIcons.icone_versenha,
                                size: 25,
                              )),
                          prefixIconColor: secondaryColor,
                          suffixIconColor: secondaryColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: secondaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: secondaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(50)),
                          hintText: 'Senha',
                          hintStyle: styleTextFieldHint,
                          fillColor: white,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: screenWidth * 0.8,
                      child: ElevatedButton(
                        style: buttonFilledSecondary,
                        onPressed: () {
                          Navigator.pushNamed(context, '/TelaCadastroPT2');
                        },
                        child: const Text(
                          "CONTINUAR",
                          style: TextStyle(
                            fontFamily: "InterSemiBold",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsetsDirectional.symmetric(vertical: 20),
                        width: screenWidth * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: screenWidth * 0.35,
                              height: 1.5,
                              color: principalGray,
                            ),
                            Text('OU'),
                            Container(
                              width: screenWidth * 0.35,
                              height: 1.5,
                              color: principalColor,
                            ),
                          ],
                        )),
                    Container(
                      width: screenWidth * 0.8,
                      child: ElevatedButton(
                        style: buttonOutlinedReversed,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          "ENTRAR",
                          style: TextStyle(
                            color: secondaryColor,
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
            ]),
          ]),
        ),
      ),
    );
  }
}
