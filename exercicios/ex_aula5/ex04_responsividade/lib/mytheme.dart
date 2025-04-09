import 'package:flutter/material.dart';

class MyThemeData {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
    primary: Color(0xFF4F8FC0),
    onPrimary: Color(0xFFFAFAFA),
    primaryContainer: Color(0xFFD0E6FA),
    onPrimaryContainer: Color(0xFF1F3B57),
    secondary: Color(0xFFA7AFC2),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE0E5F0),
    onSecondaryContainer: Color(0xFF2C2F36),
    tertiary: Color(0xFFF2C572),
    onTertiary: Color(0xFF5A3E1D),
    error: Color(0xFFD65745),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFF9F9F9),
    onBackground: Color(0xFF2E3C50),
    surface: Color.fromARGB(255, 0, 0, 0), //Cor do background
    onSurface: Color.fromARGB(255, 255, 255, 255), //Cor da fonte
      ),
    );
  }
}
