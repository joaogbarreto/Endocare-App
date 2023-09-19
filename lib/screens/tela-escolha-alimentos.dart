import 'package:flutter/material.dart';

import '../styles/button.dart';
import '../styles/color.dart';

class TelaEscolhaAlimentos extends StatefulWidget {
  const TelaEscolhaAlimentos({Key? key}) : super(key: key);

  @override
  State<TelaEscolhaAlimentos> createState() => _TelaEscolhaAlimentosState();
}

class _TelaEscolhaAlimentosState extends State<TelaEscolhaAlimentos> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: principalColor,
    appBar: AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      foregroundColor: white,
      backgroundColor: Colors.transparent,
    ),
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
                        Navigator.pushNamed(context, '/TelaCadastroAlimentos');
                      },
                      child: const Text(
                        "Alimento",
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
                        Navigator.pushNamed(context, '/TelaCadastroReceitas');
                      },
                      child: const Text(
                        "Receita",
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
