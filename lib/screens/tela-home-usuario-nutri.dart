import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/widgets/card-alimentacao.dart';

class TelaHomeUsuarioNutricionista extends StatefulWidget {
  const TelaHomeUsuarioNutricionista({Key? key}) : super(key: key);

  @override
  State<TelaHomeUsuarioNutricionista> createState() =>
      _TelaHomeUsuarioNutricionistaState();
}

class _TelaHomeUsuarioNutricionistaState
    extends State<TelaHomeUsuarioNutricionista> {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 0;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';

  final alimentos = ["Frango", "Limão", ];

  List<String> alimentoss = ["Frango", "Limão","Pão"];

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
                  onTap: () =>
                      Navigator.pushNamed(context, '/TelaPerfilUsuario'),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, right: 30),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Alimentos cadastrados',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView(children: <Widget>[
              CardAlimentacao(
                nome: 'Limão',
                ImageURI: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/6073/6073873.png"),
              ),
              CardAlimentacao(
                nome: 'Frango',
                ImageURI: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/6073/6073873.png"),
              ),
              CardAlimentacao(
                nome: 'Pão',
                ImageURI: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/6073/6073873.png"),
              ),
              CardAlimentacao(
                nome: 'Laranja',
                ImageURI: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/6073/6073873.png"),
              ),
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    child: CardAlimentacao(
                      nome: alimentoss[index], ImageURI: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/6073/6073873.png"),),
                  ),
                );
              }, childCount: alimentoss.length))
        ]),
      );
}
