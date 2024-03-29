import 'package:flutter/material.dart';

import '../styles/button.dart';
import '../styles/color.dart';

class TelaEscolha extends StatefulWidget {
  const TelaEscolha({Key? key}) : super(key: key);

  @override
  State<TelaEscolha> createState() => _TelaEscolhaState();
}

class _TelaEscolhaState extends State<TelaEscolha> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: principalColor,
    body: Column(
      children: <Widget>[
        Expanded(
          child: Container(
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
        ),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.center,
            height: MediaQuery.of(context).size.height * 0.5,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 10,
                    child: ElevatedButton(
                      style: buttonFilledWhite,
                      onPressed: () {
                        Navigator.pushNamed(context, '/TelaCadastroUsuarioAdolescentePT1');
                      },
                      child: const Text(
                        "Sou Adolescente",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1,),
                  Flexible(
                    flex: 10,
                    child: ElevatedButton(
                      style: buttonFilledPrimary2,
                      onPressed: () {
                        Navigator.pushNamed(context, '/TelaCadastroUsuarioNutricionistaPT1');
                      },
                      child: const Text(
                        "Sou Nutricionista",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
