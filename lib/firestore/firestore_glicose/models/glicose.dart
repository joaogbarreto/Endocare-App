import 'package:collection/collection.dart';

class Glicose {
  String? id;
  double sugarConcentration;
  double day;
  String hora;
  String? data;

  Glicose({this.id,required this.sugarConcentration, required this.day, required this.hora, this.data});

  Glicose.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        sugarConcentration = map["sugar Concentration"],
        day = map["day"],
        hora = map["hora"],
        data = map["data"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "sugar Concentration": sugarConcentration,
      "day": day,
      "hora": hora,
      "data": data
    };
  }
}

List<Glicose> get bloodGlicose {
  var data = <double>[100, 90, 120, 110,100, 100, 80];
  return data
      .mapIndexed(((data, element) =>
          Glicose(day: data.toDouble()+1, sugarConcentration: element, hora: '')))
      .toList();
}