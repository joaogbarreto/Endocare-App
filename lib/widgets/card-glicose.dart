import 'package:flutter/material.dart';
import 'package:primeiroprojeto/screens/tela-glicose.dart';

import '../styles/color.dart';

enum _MenuValues { Editar, Excluir }

class CardGlicose extends StatefulWidget {
  final String hora;
  final String concentracaoSugarSangue;
  final String data;

  CardGlicose(
      {Key? key, required this.hora, required this.concentracaoSugarSangue, required this.data})
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
                        "${widget.hora} - ${widget.data}",
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if(double.parse(widget.concentracaoSugarSangue)<=70)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('assets/rosto_ia.png'),
                        Container(
                          child: Text(
                            'Que pena, sua glicemia está abaixo do indicado',
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
                  if(double.parse(widget.concentracaoSugarSangue)>=120)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('assets/rosto_ia.png'),
                        Container(
                          child: Text(
                            'Que pena, sua glicemia está acima do que é indicado',
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

                  if(double.parse(widget.concentracaoSugarSangue)<120 && double.parse(widget.concentracaoSugarSangue)>70)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('assets/rosto_ia_feliz.png'),
                        Container(
                          child: Text(
                            'Parabéns, sua glicemia está na média normal',
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
            ),
          ],
        ),
      );
}
