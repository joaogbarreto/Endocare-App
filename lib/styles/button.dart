import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/color.dart';

final ButtonStyle buttonFilledWhite = ElevatedButton.styleFrom(
  minimumSize: Size.fromHeight(50),
  backgroundColor: white,
  foregroundColor: Color(0xFF2764AD),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25),
    ),
  )
);
final ButtonStyle buttonFilledRedIcon = ElevatedButton.styleFrom(
  minimumSize: Size.fromHeight(60),
  animationDuration: Duration.zero,
  backgroundColor: secondaryColorwhite  ,
  foregroundColor: white,
  elevation: 0,
  shadowColor: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25),),
  )
);
final ButtonStyle buttonFilledPrimary = ElevatedButton.styleFrom(
  minimumSize: Size.fromHeight(60),
  animationDuration: Duration.zero,
  backgroundColor: Color(0xFF2764AD),
  foregroundColor: white,
  elevation: 0,
  shadowColor: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25),),
  )
);
final ButtonStyle buttonFilledSecondary = ElevatedButton.styleFrom(
  minimumSize: Size.fromHeight(50),
  animationDuration: Duration.zero,
  backgroundColor: Colors.transparent,
  foregroundColor: newprincipalColor,
  elevation: 0,
  shadowColor: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25),),
  )
);
final ButtonStyle buttonOutlined = OutlinedButton.styleFrom(
    minimumSize: Size.fromHeight(50),
    elevation: 0,
    shadowColor: Colors.black,
    side: BorderSide(width: 1, color: white),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25),),
    )
);
final ButtonStyle buttonOutlinedReversed = OutlinedButton.styleFrom(
    minimumSize: Size.fromHeight(50),
    elevation: 0,
    shadowColor: Colors.black,
    side: BorderSide(width: 1.5 , color: secondaryColor),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25),),
    )
);

final ButtonStyle buttonElevatedRed = ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(50),
    elevation: 4,
    animationDuration: Duration.zero,
    shadowColor: Colors.black,
    backgroundColor: red,
    foregroundColor: white,
    side: BorderSide(width: 1.5 , color: secondaryColor),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25),),
    )
);