import 'package:flutter/material.dart';
import 'package:primeiroprojeto/screens/tela-glicose.dart';

import '../styles/color.dart';

enum _MenuValues { Editar, Excluir }

class CardContato extends StatefulWidget {
  final String nome;

  CardContato({
    Key? key,
    required this.nome,
  }) : super(key: key);

  @override
  State<CardContato> createState() => _CardContato();
}

class _CardContato extends State<CardContato> {
  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.09,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: principalColor,
                      ),
                    ),
                    Container(
                        child: Text(
                      widget.nome,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        color: black,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  ]),
            ),
          ],
        ),
      );
}
