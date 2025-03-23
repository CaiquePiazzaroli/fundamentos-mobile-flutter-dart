import 'package:flutter/material.dart';
import 'package:random_app/pages/random_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Codigo 1 carrega a segunda tela
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RandomPage()),
            ); //Cria um direcionamento para outra página
            //Também gerará uma seta de retorno na próxima página (randomPage) caso haja uma appbar ativa
          },
          child: Text("Random"),
        ),
      ),
    );
  }
}
