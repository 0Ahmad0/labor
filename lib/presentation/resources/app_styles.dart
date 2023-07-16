//Function To Get Text Style

import 'package:flutter/material.dart';

import 'app_fonts.dart';

TextStyle _getTetxStyle(
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

///Regular Style
TextStyle getRegularStyle({double? fontSize = FontSize.s12, Color? color}) {
  return _getTetxStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.regular, color: color);
}

///Bold Style
TextStyle getBoldStyle({double? fontSize = FontSize.s12, Color? color}) {
  return _getTetxStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.bold, color: color);
}

///SemiBold Style
TextStyle getSemiBoldStyle({double? fontSize = FontSize.s12, Color? color}) {
  return _getTetxStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.semiBold, color: color);
}

///Bold Style
TextStyle getMediumStyle({double? fontSize = FontSize.s12, Color? color}) {
  return _getTetxStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color);
}

///Light Style
TextStyle getLightStyle({double? fontSize = FontSize.s12, Color? color}) {
  return _getTetxStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.light, color: color);
}
