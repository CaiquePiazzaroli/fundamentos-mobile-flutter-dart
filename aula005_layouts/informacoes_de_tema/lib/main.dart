import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //Esquema de cores para o app no geral
  final ColorScheme sereneBlueScheme = const ColorScheme(
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
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF314B64),
  );

  //Esquema de cores para o appbar
  final AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: Color(0xFF4F8FC0), // primary
    foregroundColor: Color(0xFFFAFAFA), // onPrimary
    elevation: 2,
    shadowColor: Color(0xFF1F3B57),
    iconTheme: IconThemeData(color: Color(0xFFFAFAFA)),
    titleTextStyle: TextStyle(
      color: Color(0xFFFAFAFA),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  //Esquema de cores para o float button
  final FloatingActionButtonThemeData
  floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF4F8FC0), // Roxo suave (primary do ColorScheme)
    foregroundColor: Colors.white, // Cor do ícone
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // Cantos levemente arredondados
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: appBarTheme,
        floatingActionButtonTheme: floatingActionButtonTheme,
        fontFamily: "Times New Roman",
        colorScheme: sereneBlueScheme,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium, //Pega uma cor específica   Theme.of(context).sereneBlueScheme.primary tambem funcionaria
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
