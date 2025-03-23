import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text("My home page", style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Hello, World!",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 100,
                  height: 20,
                  child: Text('SizedBox', style: TextStyle(color: Colors.grey)),
                ),
              ),
              ElevatedButton(
                onPressed: () => {print("Ola mundo")},
                child: Text("Meu botao", style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
