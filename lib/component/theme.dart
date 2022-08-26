import 'package:flutter/material.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';

ThemeData lightMode() {
  return ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: whatsappColor),
    scaffoldBackgroundColor:  lightScaffoldBackgraoundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: whatsappColor)
  );
}

ThemeData darkMode() {
  return ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: whatsappColor),
    scaffoldBackgroundColor:  DarkScaffoldBackgraoundColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: whatsappColor)

  );
}
