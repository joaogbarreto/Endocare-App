import 'package:flutter/material.dart';
import 'package:primeiroprojeto/widgets/card-medicacao.dart';

class CadastroMedicacaoInherited extends InheritedWidget {
  CadastroMedicacaoInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<CardMedicacao> cadastroMedicacao = [
    CardMedicacao(
      key: Key('123'),
      hora: '06:00 AM',
      nome: 'Ibuprofeno',
      notas: 'Tomei depois do café',
    ),
  ];

  void newCadastroGlicose(String newHora, String newSugarConcentration,
      String newNome, String newNotas) {
    cadastroMedicacao.add(CardMedicacao(
      hora: newHora,
      nome: newNome,
      notas: newNotas,
    ));
  }

  static CadastroMedicacaoInherited of(BuildContext context) {
    final CadastroMedicacaoInherited? result = context
        .dependOnInheritedWidgetOfExactType<CadastroMedicacaoInherited>();
    assert(result != null, 'No CadastroMedicacaoInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CadastroMedicacaoInherited old) {
    return old.cadastroMedicacao.length != cadastroMedicacao.length;
  }
}
