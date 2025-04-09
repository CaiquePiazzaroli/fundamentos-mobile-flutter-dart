import 'package:flutter/material.dart';
import 'mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.getTheme(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive layouts', style: TextStyle(fontSize: 12)),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return rowsBuilder(context);
          } else {
            return columnsBuilder(context);
          }
        },
      ),
    );
  }

  //Layout para quando for Row
  Container rowsBuilder(BuildContext context) {
    double larguraDaTela = MediaQuery.of(context).size.width * 0.5;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: const Color.fromARGB(255, 136, 136, 136)),
        ),
      ),
      child: Row(
        children: [
          container1(larguraDaTela),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: const Color.fromARGB(255, 136, 136, 136),
                ),
              ),
            ),
          ),
          container2(context),
        ],
      ),
    );
  }

  //Layout para quando for Column
  Container columnsBuilder(BuildContext context) {
    double larguraDaTela = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: const Color.fromARGB(255, 136, 136, 136)),
        ),
      ),
      child: Column(
        children: [container1(larguraDaTela), container2(larguraDaTela)],
      ),
    );
  }

  //Container 1 - Parte de cima - Contem um container
  Widget container1(larguraDaTela) {
    return SizedBox(
      width: larguraDaTela,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text("Cheetah Coding", style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Mybutton("My name", () => print("Meu nome é caique")),
                Padding(padding: EdgeInsets.all(20)),
                Mybutton("My LastName", () => print("Meu sobrenome é Mendes")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Container 2 - Parte de baixo - Contem a listview
  Widget container2(context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          itemList("Dart"),
          itemList("Javascript"),
          itemList("PHP"),
          itemList("C++"),
          itemList("Dart"),
          itemList("Javascript"),
          itemList("PHP"),
          itemList("C++"),
          itemList("Dart"),
          itemList("Javascript"),
          itemList("PHP"),
          itemList("C++"),
        ],
      ),
    );
  }

  //Itens reaproveitáveis
  Widget itemList(String desc) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color.fromARGB(255, 136, 136, 136)),
        ),
      ),
      child: ListTile(
        title: Center(child: Text(desc)),
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }
  ElevatedButton Mybutton(String name, VoidCallback callbackfn) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Cor de fundo
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 2,
      ),
      onPressed: callbackfn,
      child: Text(name),
    );
  }
}
