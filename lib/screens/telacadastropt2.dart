import 'package:flutter_svg/flutter_svg.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/endocare_icons.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

class TelaCadastroPT2 extends StatefulWidget {
  const TelaCadastroPT2({Key? key}) : super(key: key);

  @override
  State<TelaCadastroPT2> createState() => _TelaCadastroPT2State();
}

class _TelaCadastroPT2State extends State<TelaCadastroPT2> {
  TextEditingController nomeController = TextEditingController();
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
                'assets/fundo_cadastro2.svg',
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
                "Quem é você?",
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
                            return 'Insira um nome';
                          }
                          return 'Insira um nome valido no campo ';
                        },
                        keyboardType: TextInputType.text,
                        controller: nomeController,
                        decoration: styleinputnome,
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
                          suffixIcon: GestureDetector(
                              onTap: () {
                                obscureText = !obscureText;
                              },
                              child: Icon(
                                Icons.calendar_month,
                                size: 35,
                              )),
                          suffixIconColor: secondaryColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: secondaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: secondaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(50)),
                          hintText: 'Data Nascimento',
                          hintStyle: styleTextField,
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
                          Navigator.pushNamed(context, '/TelaLogin');
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
                              color: gray2,
                            ),
                            Text('OU'),
                            Container(
                              width: screenWidth * 0.35,
                              height: 1.5,
                              color: gray2,
                            ),
                          ],
                        )),
                    Container(
                      width: screenWidth * 0.8,
                      child: ElevatedButton(
                        style: buttonOutlinedReversed,
                        onPressed: () {
                          Navigator.pushNamed(context, '/TelaLogin');
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
