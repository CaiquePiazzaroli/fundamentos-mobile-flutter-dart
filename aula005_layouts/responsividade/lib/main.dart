import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var renderWithMedia = true;
  @override
  Widget build(Object context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (renderWithMedia == true) {
              return _buildWithMediaquery(context);
            } else if (constraints.maxWidth > 700) {
              return _buildWideContainers(); //Buida quando o tamanho da tela for maior que 700
            } else {
              return _buildNormalContainer(); ////Buida quando o tamanho da tela for menor que 700
            }
          },
        ),
      ),
    );
  }
}

Widget _buildNormalContainer() {
  //Função que retorna um widget para uma tela pequena
  return Center(
    child: Container(height: 100.0, width: 100.0, color: Colors.red),
  );
}

Widget _buildWideContainers() {
  //Função que retorna um widget para uma tela grande
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(height: 100.0, width: 100.0, color: Colors.red),
        Container(height: 100.0, width: 100.0, color: Colors.yellow),
        Container(
          height: 100.0,
          width: 100.0,
          color: const Color.fromARGB(255, 59, 69, 255),
        ),
      ],
    ),
  );
}

Widget _buildWithMediaquery(BuildContext context) {
  double larguraDaTela = MediaQuery.of(context).size.width; //Infos sobre a largura da tela
  double alturaDaTela = MediaQuery.of(context).size.height; //Infos sobre a altura da tela
  return Container(
    height: alturaDaTela * 0.2, //O tamanho sempre irá representar 20% da altura da tela
    width: larguraDaTela * 0.8, //A largura sempre representará 80% da largura da tela
    color: Colors.amber,
    child: Text("Largura: " + larguraDaTela.toString() + " Altura: " + alturaDaTela.toString() )
  );
}
