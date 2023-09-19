import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primeiroprojeto/screens/tela-analise-ia.dart';
import 'package:primeiroprojeto/screens/tela-emergencia.dart';
import 'package:primeiroprojeto/screens/tela-home-usuario-adole.dart';
import 'package:primeiroprojeto/styles/color.dart';

class TelaHomePagesAdolescente extends StatefulWidget {
  const TelaHomePagesAdolescente({Key? key, User? user}) : super(key: key);

  @override
  State<TelaHomePagesAdolescente> createState() => _TelaHomePagesAdolescenteState();
}

class _TelaHomePagesAdolescenteState extends State<TelaHomePagesAdolescente> {
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
            TelaAnaliseIA(),
            TelaHomeUsuarioAdolescente(),
            TelaEmergencia(),
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
                Icons.bar_chart_sharp,
                color: secondaryColorblue,
              ),
              label: 'Análise',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: secondaryColorblue,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: secondaryColorblue,
                ),
                label: 'Emergência'),
          ],
          currentIndex: _currentPage,
          onTap: (pagina) {
            pc.animateToPage(pagina,
                duration: Duration(milliseconds: 400), curve: Curves.ease);
          },
        ),
      );
}
