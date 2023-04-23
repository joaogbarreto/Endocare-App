import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

import '../styles/color.dart';

class CardMedicacao extends StatefulWidget {
  final String hora;
  final String nome;
  final String notas;

  CardMedicacao(
      {Key? key,
      required this.hora,
      required this.nome,
      required this.notas,})
      : super(key: key);

  @override
  State<CardMedicacao> createState() => _Medicacao();
}

class _Medicacao extends State<CardMedicacao> {
  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 80.0, bottom: 30),
                    child: Container(
                      child: Text(
                        'Notas',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            color: black2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            widget.notas,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                color: gray2),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: newprincipalColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                          'Nome',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              color: secondaryColorblue2),
                          textAlign: TextAlign.center,
                        )),
                        Container(
                            child: Text(
                          widget.nome,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              color: secondaryColorblue2),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                          'Horário',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              color: secondaryColorblue2),
                          textAlign: TextAlign.center,
                        )),
                        Container(
                          child: Text(
                            widget.hora,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              color: secondaryColorblue2
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
