import 'package:flutter/material.dart';

class MyNewThemeData {
  static ThemeData myTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 215, 243, 33), // Define a cor de fundo azul
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 243, 243, 33)),
      useMaterial3: true,
    );
  }
}
