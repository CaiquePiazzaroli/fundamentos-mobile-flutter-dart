import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.blue),
      body: Center(child: Text("App")),
      floatingActionButton: FloatingActionButton(
        //Botao pequeno no canto inferior direito
        onPressed: () => {"Float"},
        child: Icon(Icons.star), //Tipo do botao
        shape: CircleBorder(), //Formato do botao
        backgroundColor: Colors.blue, //Cor do botao
        foregroundColor: Colors.white, //Cor do icone
      ),
    );
  }
}
