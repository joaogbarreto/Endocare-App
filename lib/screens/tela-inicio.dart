import 'package:flutter/material.dart';

import '../styles/button.dart';
import '../styles/color.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: principalColor,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_fundoazul.jpg',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "Endocare",
                    style: TextStyle(
                      color: white,
                      decorationColor: white,
                      fontFamily: "Poppins",
                      fontSize: 80,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: buttonFilledWhite,
                      onPressed: () {
                        Navigator.pushNamed(context, '/TelaLogin');
                      },
                      child: const Text(
                        "ENTRAR",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5
                        ),
                      ),
                    ),
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: white, width: 1.0))),
                        margin: EdgeInsets.only(top: 30),
                        child: GestureDetector(
                          onTap:() => Navigator.pushNamed(context, '/TelaEscolha'),
                          child: Text(
                            "Não tem uma conta? Cadastre-se",
                            style: TextStyle(
                              color: white,
                              decorationColor: white,
                              fontFamily: "Poppins",
                              fontSize: 16,
                            ),
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
      );
}
