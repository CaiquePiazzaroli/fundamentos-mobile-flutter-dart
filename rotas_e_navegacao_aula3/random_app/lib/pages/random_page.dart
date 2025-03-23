
import 'dart:math';

import 'package:flutter/material.dart';

class RandomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Page")), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Random().nextInt(20)}"),
            TextButton(onPressed: () => {
              //Retornar para a primeira tela
              Navigator.pop(context) //Desempilha a página random page
            }, child: Text("Voltar"))
          ],
        ),
      ),
    );
  }

}