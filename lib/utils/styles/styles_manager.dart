import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    {String fontFamily = FontConstants.openSans}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.s16,
  required Color color,
  String fonFamily = FontConstants.openSans,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,
      fontFamily: fonFamily);
}

// medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  required Color color,
  String fonFamily = FontConstants.openSans,
}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,
      fontFamily: fonFamily);
}

// medium style

TextStyle getLightStyle({
  double fontSize = FontSize.s16,
  required Color color,
  String fonFamily = FontConstants.openSans,
}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,
      fontFamily: fonFamily);
}

// bold style

TextStyle getBoldStyle({
  double fontSize = FontSize.s34,
  required Color color,
  String fonFamily = FontConstants.openSans,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    fontFamily: fonFamily,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s16,
  required Color color,
  String fonFamily = FontConstants.openSans,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
      fontFamily: fonFamily);
}
