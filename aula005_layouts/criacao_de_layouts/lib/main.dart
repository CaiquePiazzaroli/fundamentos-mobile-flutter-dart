import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 159, 226, 111)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Caique"),
            Text("Mendes"),
            //Tanto column como listview possuem altura infinita, isso gera um erro
            ListView(
                shrinkWrap: true, //ShrinkWrap ajuda previnir o erro em tempo de execução
                children: [Text("Com shrinkWrap 1"), Text("com shrinkWrap 2")],
            ),
            Expanded( //Outra maneira é utilizando o expanded
              child: ListView(
                children: [Text("Com Expanded 1"), Text("Com Expanded 2")],
              ),
            ),
            SizedBox( //Outra maneira utilizando o sizedbox
              height: 200,
              child: ListView(
                children: [Text("Com SizedBox 1 "), Text("Com SizedBox 2")],
              ),
            ),
            Container( //Outra maneira utilizando o sizedbox
              height: 100,
              child: ListView(children: [Text("Com Container 1 "), Text("Com Container 2")],),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
