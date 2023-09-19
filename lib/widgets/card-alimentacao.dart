import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primeiroprojeto/screens/tela-glicose.dart';

import '../styles/color.dart';

enum _MenuValues { Editar, Excluir }

class CardAlimentacao extends StatefulWidget {
  final String nome;
  final NetworkImage ImageURI ;

  CardAlimentacao({
    Key? key,
    required this.nome,
    required this.ImageURI,
  }) : super(key: key);

  @override
  State<CardAlimentacao> createState() => _CardAlimentacao();
}

class _CardAlimentacao extends State<CardAlimentacao> {
  @override
  Widget build(BuildContext context) => Container(
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset('assets/images/frango.png',fit: BoxFit.cover, width: 300,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 22,
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Container(
                          child: FaIcon(FontAwesomeIcons.heart)
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ],
    ),
  );
}
