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
  List<String> filmesAvaliados = [];


  String getMovie() {
    List<String> listaDeFilmes = [
      'Interestelar',
      'Divertidamente',
      'Titanic',
      'Madrugada dos Mortos'
    ];
    filme = listaDeFilmes[Random().nextInt((listaDeFilmes.length - 1))];
    print(filme);
    notifyListeners();
    return filme;
  }

  void setMovie() {
    filmesAvaliados.add(filme);
    print(filmesAvaliados);
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MeuEstadoApp>();
    int selectedIndex = 0;
    Widget page;

  
    
    return Scaffold(
      body: Row(
        children: [
          SafeArea(child: NavigationRail(
            extended: false,
            destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ], 
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
                selectedIndex = value;
              }

          )),
          Expanded(
            child: Container(
              child: Center(
                child: FavoritesPage(appState: appState,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({
    super.key,
    required this.appState,
  });

  final MeuEstadoApp appState;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('A random AWSOME idea:'),
        Text(appState.filme),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {appState.getMovie()},
                child: Text("Proximo filme")),
            ElevatedButton.icon(
                onPressed: () => {appState.setMovie()}, 
                label: Text("Gostei"),
                icon: Icon(Icons.favorite_border),)
          ],
        )
      ],
    );
  }
}


class FavoritesPage extends StatelessWidget {


  

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MeuEstadoApp>();
    return Scaffold(
      body: appState.filmesAvaliados[0],
    );
  }

}