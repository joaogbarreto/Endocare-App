import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height ,
          child:  SvgPicture.asset(
            'assets/fundo.svg',
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 30),
            child: Image.asset(
              "assets/logo.png",
              width: 100,
              height: 100,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "ENDOCARE",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 50,
                        color: white,
                      ),     
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    margin: EdgeInsets.only(top: 10),
                    child: const Text(
                      "Nosso objetivo é ajudar e incentivar os jovens a se cuidarem ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      style: buttonFilledWhite,
                      onPressed: () {
                        Navigator.pushNamed(context,'/TelaLogin');
                      },
                      child: const Text(
                        "ENTRAR",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: OutlinedButton(
                      style: buttonOutlined,
                      onPressed: () {
                        Navigator.pushNamed(context, '/TelaCadastroPT1');
                      },
                      child: Text(
                        "CADASTRAR",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: white, width: 1.0))),
                      margin: EdgeInsets.only(top: 50),
                      child: Text(
                          "Saiba mais sobre a gente",
                          style: TextStyle(
                            color: white,
                            decorationColor: white,
                            fontFamily: "Poppins",
                            fontSize: 16,
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
