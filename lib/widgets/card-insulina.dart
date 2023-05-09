import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

import '../styles/color.dart';

class Insulina extends StatefulWidget {
  final String data;
  final String hora;
  final String evento;
  final String notas;
  final String concentracaoInsulina;

  Insulina(
      {Key? key,
      required this.data,
      required this.hora,
      required this.evento,
      required this.notas,
      required this.concentracaoInsulina})
      : super(key: key);

  @override
  State<Insulina> createState() => _Insulina();
}

class _Insulina extends State<Insulina> {
  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: white, offset: Offset(-5, 0)),
                    BoxShadow(color: white, offset: Offset(5, 0)),
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.03,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: principalColor,
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 10, bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data,
                          style: styleTextFieldWhite,
                        ),
                        Text(
                          widget.hora,
                          style: styleTextFieldWhite,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Evento',
                              style: styleTextFieldHint,
                            ),
                          ),
                          Container(
                            child: Text(
                              'Notas',
                              style: styleTextFieldHint,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              widget.evento,
                              style: TextStyle(
                                fontSize: 20,
                                color: principalGray,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.notas,
                              style: TextStyle(
                                fontSize: 20,
                                color: principalGray,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              widget.concentracaoInsulina,
                              style: styleTextFieldHint,
                            ),
                          ),
                          Container(
                            child: Text(
                              'ml',
                              style: styleTextFieldHint,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
