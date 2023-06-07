import 'package:collection/collection.dart';

class ContatosEmergencia {
  String? id;
  String nome;
  String telefone;
  String? data;

  ContatosEmergencia({this.id, this.data, required this.nome, required this.telefone});

  ContatosEmergencia.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        data = map["data"],
        nome = map["nome"],
        telefone = map["telefone"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "data": data,
      "nome": nome,
      "telefone": telefone
    };
  }
}
//
// List<ContatosEmergencia> get bloodGlicose {
//   var data = <double>[100, 90, 120, 110,100, 100, 80];
//   return data
//       .mapIndexed(((data, element) =>
//       ContatosEmergencia(day: data.toDouble()+1, sugarConcentration: element, hora: '')))
//       .toList();
// }