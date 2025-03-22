import 'package:flutter/material.dart';

void main() {
  runApp(MyAppStackPositioned());
}

//My app que será chamado  na main e herda de statelesswidget
class MyApp extends StatelessWidget {
  //Metodo obrigatório para implementar o StatelessWidget e adiciona novas folhas de widgets
  //BuildContext é usada pelo flutter para saber mais detalhes sobre o widget quando a arvore está sendo percorrida
  @override
  Widget build(BuildContext context) {
    //Utilizando o context para ver informações sobre o app
    final textTheme =
        Theme.of(context).textTheme; //Tema padrao da arvore de widgets

    final mediaQuery = MediaQuery.of(context); // Acessa informações da tela
    final alturaTela = mediaQuery.size.height; // Altura da tela
    final comprimentoTela = mediaQuery.size.width; // Largura da tela

    return MaterialApp(
      //MaterialApp - É um widget que facilita a estruturação do nosso app;
      home: Scaffold(
        //Implementa a estrutura visual básica de layout com Material Design
        appBar: AppBar(
          title: Center(
            child: Text(
              "Barra",
              //Utilizando informações do tema padrão
              style: TextStyle(
                fontSize: textTheme.headlineLarge!.fontSize,
                color: textTheme.headlineLarge!.color,
              ),
            ),
          ),
        ), //Barra superiror. Obs Widget Center centraliza e Text cria um texto
        body: Center(
          child: Text("Tamanho da tela: ${alturaTela} x ${comprimentoTela}"),
        ), //Corpo o widget
      ),
    );
  }
}

//Exemplo com children - Alterar na main
class MyOtherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[Text("Hello, "), Text("World")],
          ), //children: Recebe um array de Textos
        ),
      ),
    );
  }
}

//Exemplo com listviews
class MyAppListView extends StatelessWidget {
  //Cria uma lista com 100 inteiros
  final listInt = List<int>.generate(100, (i) => i);

  @override
  Widget build(Object context) {
    return MaterialApp(
      home: Scaffold(
        // O construtor nomeado 'builder'cria uma lista de widgets e pega a listInt como parametros
        body: ListView.builder(
          //ListView.builder cria os itens sob demanda, na medida em que é necessário
          itemCount: listInt.length, //Define quantos items terá essa lista
          itemBuilder: (context, index) {
            return Text("${listInt[index]}");
          }, //Retorna os itens da lista
        ),
      ),
    );
  }
}

//Exemplo com Container
class MyAppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 800, //tamanho
          width: 250, //Largura
          color: const Color.fromARGB(255, 139, 137, 96), //Cor de fundo
          alignment: Alignment.center, //Alinhamento
          child: Text(
            //Conteúdo e estilo
            "aa",
            style: TextStyle(
              color:
                  Colors
                      .white, // Adicionando cor ao texto para melhor visibilidade
              fontSize: 24, // Tamanho da fonte
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppStackPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              "Utilizando Stack e Positioned",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Stack(
          children: [
            // Quadrado azul (com Positioned)
            Positioned(
              top: 40,
              left: 30, // Define a posição inicial
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            // Quadrado vermelho (ao lado do azul)
            Positioned(
              top: 40,
              left: 70, // Agora realmente fica ao lado do azul
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
