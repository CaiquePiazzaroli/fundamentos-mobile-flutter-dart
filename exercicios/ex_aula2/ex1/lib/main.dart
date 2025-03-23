import 'package:flutter/material.dart';

void main() {
  runApp(Exercicio1());
}

class Exercicio1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Flutter is fun!", style: TextStyle(color: Colors.white)),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 90,
              left: 60,
              child: Container(
                height: 80,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5), //Adiciona o padding
                color: Colors.red,
                child: Text("Hi Mom 🐣"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
