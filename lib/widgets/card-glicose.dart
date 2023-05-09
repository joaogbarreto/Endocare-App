import 'package:flutter/material.dart';
import 'package:primeiroprojeto/screens/tela-glicose.dart';

import '../styles/color.dart';

enum _MenuValues { Editar, Excluir }

class CardGlicose extends StatefulWidget {
  final String hora;
  final String concentracaoSugarSangue;

  CardGlicose(
      {Key? key, required this.hora, required this.concentracaoSugarSangue})
      : super(key: key);

  @override
  State<CardGlicose> createState() => _Glicose();
}

class _Glicose extends State<CardGlicose> {
  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Text(
                        widget.hora,
                        style: TextStyle(
                            fontFamily: 'Poppins', fontSize: 22, color: black2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Text(
                        widget.concentracaoSugarSangue,
                        style: TextStyle(
                            fontFamily: 'Poppins', fontSize: 22, color: black2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Text(
                        'mg/dl',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontSize: 22, color: black2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: backCards,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('assets/rosto_ia.png'),
                  Container(
                    child: Text(
                      'Bom, parece que você está com hipoglicemia hoje',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
