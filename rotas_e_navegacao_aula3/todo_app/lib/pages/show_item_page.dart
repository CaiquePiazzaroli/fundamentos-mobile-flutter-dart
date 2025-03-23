import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_item.dart';

class ShowItemPage extends StatelessWidget {
  //Declara o campo que mantém o todoItem
  final TodoItem todo;

  //Cria um construtor que obriga a receber um todoItem
  ShowItemPage({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(children: [
          Text(todo.description), 
          Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
          ElevatedButton( onPressed: () => Navigator.pop(context, true), child: Text("Ok"), ), //Botao de ok - Retorna true para a var result em todo_list_view
          Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
          ElevatedButton( onPressed: () => Navigator.pop(context, false), child: Text("Cancelar"), ), //Botao de Cancelar Retorna false para a var result em todo_list_view
          ]),
      ),
    );
  }
}
