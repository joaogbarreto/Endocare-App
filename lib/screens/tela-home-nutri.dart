import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primeiroprojeto/screens/tela-alimentacao-nutri.dart';
import 'package:primeiroprojeto/screens/tela-analise-ia.dart';
import 'package:primeiroprojeto/screens/tela-home-usuario-nutri.dart';
import 'package:primeiroprojeto/styles/color.dart';

class TelaHomePagesNutricionista extends StatefulWidget {
  const TelaHomePagesNutricionista({Key? key, User? user}) : super(key: key);

  @override
  State<TelaHomePagesNutricionista> createState() => _TelaHomePagesNutricionistaState();
}

class _TelaHomePagesNutricionistaState extends State<TelaHomePagesNutricionista> {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 1;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: _currentPage);
  }

  setPaginaAtual(pagina) {
    setState(() {
      _currentPage = pagina;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: white,
    body: PageView(
      controller: pc,
      children: [
        TelaAlimentacaoNutricionista(),
        TelaHomeUsuarioNutricionista(),
        // TelaEmergencia(),
      ],
      onPageChanged: setPaginaAtual,
    ),
    bottomNavigationBar: BottomNavigationBar(
      fixedColor: secondaryColorblue,
      showSelectedLabels: null,
      showUnselectedLabels: null,
      iconSize: 40,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: secondaryColorblue,
          ),
          label: 'Alimentação',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: secondaryColorblue,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_sharp,
              color: secondaryColorblue,
            ),
            label: 't'),
      ],
      currentIndex: _currentPage,
      onTap: (pagina) {
        pc.animateToPage(pagina,
            duration: Duration(milliseconds: 400), curve: Curves.ease);
      },
    ),
  );
}
