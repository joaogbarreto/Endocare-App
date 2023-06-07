import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primeiroprojeto/firestore/firestore_glicose/models/glicose.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/endocare_icons.dart';
import 'package:primeiroprojeto/widgets/HorizontalSliverList.dart';
import 'package:primeiroprojeto/widgets/card-contato.dart';
import 'package:primeiroprojeto/widgets/card-insulina.dart';
import 'package:primeiroprojeto/widgets/card-medicacao.dart';
import 'package:primeiroprojeto/widgets/card-glicose.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';
import 'package:primeiroprojeto/widgets/navigationdrawer.dart';

import '../data/cadastro_glicose_inherited.dart';
import '../firestore/firestore_contatos_emergencia/models/contatos.dart';

class TelaEmergencia extends StatefulWidget {
  const TelaEmergencia({Key? key}) : super(key: key);

  @override
  State<TelaEmergencia> createState() => _TelaEmergenciaState();
}

class _TelaEmergenciaState extends State<TelaEmergencia> {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 0;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';

  List<ContatosEmergencia> listContatosEmergencia = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 30, top: 40, bottom: 10),
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(29.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                    color: backCards,
                    borderRadius: BorderRadius.circular(55),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                    ]),
                child: Image.asset(
                  'assets/imagem_ambulancia.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Contatos de Emergência',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          HorizontalSliverList(
            children: [
              InkWell(
              // onDoubleTap: () =>
              //     showFormModal(model: listGlicose[index]),
              // onLongPress: () => showDialog(
              //     context: context,
              //     builder: (context) => showDialogModal(index)),
              child: CardContato(
                nome: 'Mae',
              ),
            ),
            ]
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, '/TelaInsulina');
                              },
                              style: buttonFilledRedIcon,
                              child: FaIcon(
                                FontAwesomeIcons.syringe,
                                size: 40,
                                color: principalColor,
                              )),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Insulina',
                          style: TextStyle(
                              color: principalGray,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        elevation: 5,
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/TelaGlicose');
                                },
                                style: buttonFilledRedIcon,
                                child: Icon(
                                  Icons.water_drop_outlined,
                                  size: 50,
                                  color: principalColor,
                                ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Glicose',
                          style: TextStyle(
                              color: principalGray,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/TelaAlimentacao');
                            },
                            style: buttonFilledRedIcon,
                            child: FaIcon(
                              FontAwesomeIcons.pizzaSlice,
                              size: 40,
                              color: principalColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Alimentação',
                          style: TextStyle(
                              color: principalGray,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/TelaMedicacao');
                              },
                              style: buttonFilledRedIcon,
                              child: Icon(
                                Icons.local_hospital_outlined,
                                size: 40,
                                color: principalColor,
                              )),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Medicação',
                          style: TextStyle(
                              color: principalGray,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
}
