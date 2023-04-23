import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primeiroprojeto/objects/glicose.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/endocare_icons.dart';
import 'package:primeiroprojeto/widgets/card-insulina.dart';
import 'package:primeiroprojeto/widgets/card-medicacao.dart';
import 'package:primeiroprojeto/widgets/cardglicose.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';
import 'package:primeiroprojeto/widgets/navigationdrawer.dart';

import '../data/cadastro_glicose_inherited.dart';

class TelaAnaliseIA extends StatefulWidget {
  const TelaAnaliseIA({Key? key}) : super(key: key);

  @override
  State<TelaAnaliseIA> createState() => _TelaAnaliseIAState();
}

class _TelaAnaliseIAState extends State<TelaAnaliseIA> {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 0;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: white,
    body: SafeArea(
      child: Column(children: <Widget>[
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text('Olá,',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 22,
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Text(
                                  nome,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 22,
                                      color: black,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: newprincipalColor,
                  ),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: newprincipalColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                BoxShadow(
                color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(0, 5)),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.20,
                  // child: SvgPicture.asset(
                  //   'assets/virtual_ai1.svg',
                  //   fit: BoxFit.fill,
                  // ),
                  child: Image.asset('assets/virtual_ai1.png'),
                ), // imagem
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      'Olá, parece que você ainda não cadastrou a sua glicose hoje',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 22,
                          color: black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: newprincipalColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                BoxShadow(
                color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(0, 5)),
      ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.20,
                  // child: SvgPicture.asset(
                  //   'assets/virtual_ai1.svg',
                  //   fit: BoxFit.fill,
                  // ),
                  child: Image.asset('assets/virtual_ai1.png'),
                ), // imagem
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      'Olá, você sabia que para ter uma boa qualidade de vida é bom...',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 22,
                          color: black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: newprincipalColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                BoxShadow(
                color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(0, 5)),
      ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.20,
                  // child: SvgPicture.asset(
                  //   'assets/virtual_ai1.svg',
                  //   fit: BoxFit.fill,
                  // ),
                  child: Image.asset('assets/virtual_ai1.png'),
                ), // imagem
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      'Olá, parece que a sua glicose está alta hoje',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 22,
                          color: black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Expanded(
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Container(
                  color: white,
                )
            )
        )
      ]),
    ),
  );
}
