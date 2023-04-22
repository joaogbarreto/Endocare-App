import 'package:flutter/material.dart';
import 'package:primeiroprojeto/widgets/cardglicose.dart';

class CadastroGlicoseInherited extends InheritedWidget {
  CadastroGlicoseInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<CardGlicose> cadastroGlicose = [
    CardGlicose(
    key: Key('123'),
    hora: '06:00 AM',
    concentracaoSugarSangue: '30',
  ),
  ];

  void newCadastroGlicose(String newHora, String newSugarConcentration) {
    cadastroGlicose.add(CardGlicose(
      hora: newHora,
      concentracaoSugarSangue: newSugarConcentration,));
  }

  static CadastroGlicoseInherited of(BuildContext context) {
    final CadastroGlicoseInherited? result =
    context.dependOnInheritedWidgetOfExactType<CadastroGlicoseInherited>();
    assert(result != null, 'No CadastroGlicosInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CadastroGlicoseInherited old) {
    return old.cadastroGlicose.length != cadastroGlicose.length;
  }
}
