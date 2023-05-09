import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/endocare_icons.dart';

final TextStyle styleTextFieldHint = TextStyle(
  fontFamily: "Poppins",
  fontSize: 18,
  color: principalGray,
  fontWeight: FontWeight.bold,
);
final TextStyle styleTextFieldWhite = TextStyle(
  fontFamily: "Poppins",
  fontSize: 18,
  color: white,
  fontWeight: FontWeight.bold,
);
final TextStyle styleTextFieldPrincipalColor = TextStyle(
  fontFamily: "Poppins",
  fontSize: 18,
  color: principalColor,
  fontWeight: FontWeight.bold,
);
final TextStyle styleText = TextStyle(
  fontFamily: "Poppins",
  fontSize: 16,
  color: principalColor,
  fontWeight: FontWeight.bold,
);
final TextStyle styleTextMenu = TextStyle(
  fontFamily: "Poppins",
  fontSize: 20,
  color: black,
  fontWeight: FontWeight.bold,
);
final InputDecoration styleinputprimary = InputDecoration(
  prefixIcon: Icon(
    EndocareIcons.icone_cadeado,
    size: 40,
  ),
  prefixIconColor: secondaryColor,
  enabledBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: secondaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(50)),
  hintText: 'E-Mail',
  hintStyle: styleTextFieldHint,
  fillColor: white,
  filled: true,
  focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: secondaryColor, width: 2.5),
      borderRadius: BorderRadius.circular(50)),
);

final InputDecoration styleinputnome = InputDecoration(
  suffixIcon: Icon(
    Icons.person,
    size: 40,
  ),
  suffixIconColor: secondaryColor,
  enabledBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: secondaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(50)),
  hintText: 'Nome',
  hintStyle: styleTextFieldHint,
  fillColor: white,
  filled: true,
  focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: secondaryColor, width: 2.5),
      borderRadius: BorderRadius.circular(50)),
);
