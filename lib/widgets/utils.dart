import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingValue textManipulation(
  TextEditingValue oldValue,
  TextEditingValue newValue,{
    TextInputFormatter? textInputFormatter,
      String formatPattern(String filteredString)?,
}){
  final originalUserInput = newValue.text;

  newValue = textInputFormatter != null
  ? textInputFormatter.formatEditUpdate(oldValue, newValue)
  :newValue;

  int selectionIndex = newValue.selection.end;

  final newText = formatPattern!=null ? formatPattern(newValue.text): newValue.text;

  if (newText == newValue.text){
    return newValue;
  }

  int insertCount = 0;

  int inputCount = 0;

  bool _isUserInput(String s){
    if(textInputFormatter == null) return originalUserInput.contains(s);
    return newValue.text.contains(s);
  }

  for(int i =0; i<newText.length && inputCount< selectionIndex; i++){
    final caracter = newText[i];

    if(_isUserInput(caracter)){
      inputCount++;
    }else{
      insertCount++;
    }
  }

  selectionIndex+=insertCount;
  selectionIndex= min(selectionIndex, newText.length);

  if(selectionIndex-1 >= 0 && selectionIndex-1<newText.length &&
  !_isUserInput(newText[selectionIndex-1])){
    selectionIndex--;
  }


  return newValue.copyWith(
    text: newText,
    selection: TextSelection(baseOffset: selectionIndex, extentOffset: newText.length),
    composing: TextRange.empty);
}