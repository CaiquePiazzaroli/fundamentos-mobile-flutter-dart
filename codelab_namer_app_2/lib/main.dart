import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MeuEstadoApp(),
      child: MaterialApp(
        title: 'Aplicativo de nomes de Filmes',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MeuEstadoApp extends ChangeNotifier {
  String filme = 'Click to Generate a Movie'; 
  
  String getMovie() {
    List<String> listaDeFilmes = ['Interestelar','Divertidamente','Titanic', 'Madrugada dos Mortos'];
    filme= listaDeFilmes[Random().nextInt((listaDeFilmes.length-1))];
    print(filme);
    notifyListeners();
    return filme;
  }
  
}

class MyHomePage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MeuEstadoApp>();
  
    return Scaffold(
      body: Column(
        children: [
          Text('A random AWSOME idea:'),
          Text(appState.filme),
          ElevatedButton(onPressed: () => {
            appState.getMovie()
          } , child: Text("Botao"))
        ],
      ),
    );
  }
}