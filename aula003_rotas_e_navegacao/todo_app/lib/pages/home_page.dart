
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_item.dart';
import '../widget/todo_list_view.dart';

class HomePage extends StatelessWidget {
  late final List<TodoItem> todos; //Cria uma lista de todoItens

  HomePage() { //COnstrutor
    todos = List.generate(30, (index) => TodoItem(title: "Item ${index}", description: "Uma descrição do item ${index}")); //Popula a lista
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: TodoListView(todos: todos),
      );
  }

}