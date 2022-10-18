import 'package:flutter/material.dart';
import 'package:whatsapp_agora_sample/constants/dimens.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';

ThemeData lightMode() {
  return ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: SnColors.whatsappColor),
      scaffoldBackgroundColor: SnColors.lightScaffoldBackgraoundColor,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(color: SnColors.whatsappColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.small),
            borderSide: BorderSide(color: SnColors.whatsappColor),
          ),
          filled: true,
          fillColor: SnColors.lightScaffoldBackgraoundColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: SnColors.whatsappColor));
}

ThemeData darkMode() {
  return ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: SnColors.whatsappColor),
      scaffoldBackgroundColor: SnColors.DarkScaffoldBackgraoundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: SnColors.whatsappColor));
}
