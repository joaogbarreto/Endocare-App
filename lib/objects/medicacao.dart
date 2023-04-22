import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class Medicacao {
  String? id;
  double day;
  String hora;
  String nome;
  String notas;

  Medicacao({this.id, required this.day, required this.hora, required this.nome, required this.notas});

  Medicacao.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        day = map["day"],
        hora = map["hora"],
        nome = map["nome"],
        notas = map["notas"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "day": day,
      "hora": hora,
      "nome": nome,
      "notas": notas
    };
  }
}