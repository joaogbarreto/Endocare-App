import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/color.dart';

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
                GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context, '/TelaPerfilUsuario'),
                  child: Padding(
                    padding: EdgeInsets.only(top: 9, right: 30),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: const NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
                    ),
                  ),
                )
              ],
            )),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: double.infinity,
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
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.20,
                    // child: SvgPicture.asset(
                    //   'assets/virtual_ai1.svg',
                    //   fit: BoxFit.fill,
                    // ),
                    child: Image.asset('assets/virtual_ai1.png'),
                  ), // imagem
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 30.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'Olá, parece que a sua glicose está alta hoje',
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
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: backCards,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
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
                    width: MediaQuery.of(context).size.width * 0.4,
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
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'Olá, parece que você ainda não cadastrou a sua glicose hoje',
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
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: backCards,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
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
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.20,
                    // child: SvgPicture.asset(
                    //   'assets/virtual_ai1.svg',
                    //   fit: BoxFit.fill,
                    // ),
                    child: Image.asset('assets/virtual_ai1.png'),
                  ), // image
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 30.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'Olá, você sabia que para ter uma boa qualidade de vida é bom...',
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
      ]),
    ),
  );
}
