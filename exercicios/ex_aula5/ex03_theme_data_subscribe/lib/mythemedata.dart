import 'package:flutter/material.dart';

class MyThemeData {
  static ThemeData myTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.blue, // Define a cor de fundo azul
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    );
  }
}
