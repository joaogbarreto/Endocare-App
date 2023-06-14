// import 'dart:collection';
//
// import 'package:flutter/material.dart';
//
// import '../firestore/firestore_glicose/models/glicose.dart';
//
// class GlicoseNotifier extends ChangeNotifier{
//   List<Glicose> _list =[];
//
//   UnmodifiableListView<Glicose> get _lista => UnmodifiableListView(_list);
//
//   saveAll(List<Glicose> glicoses){
//     glicoses.forEach((glicose) {
//       if(!_list.contains(glicose)) _list.add(glicose);
//     });
//     notifyListeners();
//   }
//
// }