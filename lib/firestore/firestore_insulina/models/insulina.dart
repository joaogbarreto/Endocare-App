

class Insulina {
  String? id;
  double day;
  String hora;
  String notas;
  double dosagemInsulina;

  Insulina({this.id, required this.day, required this.hora, required this.notas, required this.dosagemInsulina});

  Insulina.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        day = map["day"],
        hora = map["hora"],
        notas = map["notas"],
        dosagemInsulina = map["dosagem Insulina"];


  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "day": day,
      "hora": hora,
      "dosagem Insulina" : dosagemInsulina,
      "notas": notas
    };
  }
}