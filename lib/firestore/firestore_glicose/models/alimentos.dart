import 'package:collection/collection.dart';

class Alimentos {
  String? id;
  String nome;
  String grupo;
  double calorias;
  double carboidratos;
  String vitaminas;
  String minerais;
  double proteina;
  double fibras;
  String gordura;
  double qntdGordura;

  Alimentos({this.id,
    required this.nome,
    required this.grupo,
    required this.calorias,
    required this.carboidratos,
    required this.vitaminas,
    required this.minerais,
    required this.proteina,
    required this.fibras,
    required this.gordura,
    required this.qntdGordura,
  });

  Alimentos.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        grupo = map["grupo Alimentar"],
        calorias = map["calorias"],
        carboidratos = map["carboidratos"],
        vitaminas = map["vitaminas"],
        minerais = map["minerais"],
        proteina = map["proteina"],
        fibras = map["fibras"],
        gordura = map["gordura"],
        qntdGordura = map["quantidade de Gordura"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "grupo Alimentar": grupo,
      "calorias": calorias,
      "carboidratos": carboidratos,
      "vitaminas": vitaminas,
      "minerais": minerais,
      "proteinas": proteina,
      "fibras": fibras,
      "gordura": gordura,
      "quantidade de Gordura": qntdGordura,
    };
  }
}
//
// List<Alimentos> get bloodGlicose {
//   var data = <double>[100, 90, 120, 110, 100, 100, 80];
//   return data
//       .mapIndexed(((data, element) => Alimentos(
//           day: data.toDouble() + 1, sugarConcentration: element, hora: '')))
//       .toList();
// }
