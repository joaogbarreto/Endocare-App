import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';

class TelaHomeUsuarioAdolescente extends StatefulWidget {
  const TelaHomeUsuarioAdolescente({Key? key}) : super(key: key);

  @override
  State<TelaHomeUsuarioAdolescente> createState() => _TelaHomeUsuarioAdolescenteState();
}

class _TelaHomeUsuarioAdolescenteState extends State<TelaHomeUsuarioAdolescente> {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 0;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, '/TelaPerfilUsuario'),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 30),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
                  ),
                ),
              )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(29.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                    color: backCards,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.20,
                      // child: SvgPicture.asset(
                      //   'assets/virtual_ai1.svg',
                      //   fit: BoxFit.fill,
                      // ),
                      child: Image.asset(
                        'assets/virtual_ai1.png',
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ), // imagem
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          'Olá tudo bem? Eu sou a Margô e estou aqui para acompanhar você.',
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 22,
                              color: black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                                Navigator.pushNamed(context, '/TelaInsulina');
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
