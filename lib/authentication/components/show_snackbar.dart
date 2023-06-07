import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String mensagem,
  bool isErro = true,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(mensagem),
    backgroundColor: (isErro) ? Colors.red : Colors.green,
    duration: Duration(seconds: 5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}