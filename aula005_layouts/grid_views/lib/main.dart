import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView( //GridView.extent GridView.builder GridView.count
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //Determina a quantidade de colunas
          ),
          children: [
            Container(color: Colors.red),
            Container(color: Colors.amber),
            Container(color: Colors.black),
            Container(color: Colors.orange),
            Container(color: Colors.red),
            Container(color: Colors.amber),
            Container(color: Colors.black),
            Container(color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
