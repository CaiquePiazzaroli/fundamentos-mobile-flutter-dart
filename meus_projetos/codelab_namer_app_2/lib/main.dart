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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 57, 245)),
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

//Cria uma classe MyHomePage que é um widget do tipo Stateful
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
              child: NavigationRail(
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
                    setState(() {
                      selectedIndex = value;
                    });
                  })),
          Expanded( //Deixa o widget grande na tela
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Center(
                child: page,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MeuEstadoApp>();

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
              icon: Icon(Icons.favorite_border),
            )
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

    //Quando a lista é vazia
    if(appState.filmesAvaliados.isEmpty) {
      return Text("Nenhum filme avaliado");
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text("Listas de filmes avaliados por você:"),
        ),
        for(var filme in appState.filmesAvaliados) 
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(filme.toUpperCase()),
          ),
      ],
    );
  }
}
