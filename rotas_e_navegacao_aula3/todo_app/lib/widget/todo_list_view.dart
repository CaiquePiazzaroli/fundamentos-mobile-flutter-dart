import 'package:flutter/material.dart';
import '../model/todo_item.dart';
import '../pages/show_item_page.dart';

class TodoListView extends StatelessWidget {
  final List<TodoItem> todos; //Cria uma lista de todos como parametro para TodoListView

  //Construtor
  const TodoListView({ 
    required this.todos, //Recebe uma lista de TodoItem
  });

  //Função futura que sera executada quando clicar no objeto da lista
  Future _showResponseFromNextPage(BuildContext context, int index) async {

    //O código fica nessa parte esperando um retorno de result
    final result = await Navigator.push( //Abre a página da todoItem e espera por uma resposta
           context,  
           MaterialPageRoute(builder: (context) => ShowItemPage(todo: todos[index])) //Empilha uma nova rota com as informações do Itemtodo da lista
      );

    ScaffoldMessenger.of(context) //Cria uma mensagem da tela do TodoItem
    ..removeCurrentSnackBar()
    //Retorna de acordo ou nao concorda em função do botao clicado na outra página
    ..showSnackBar(SnackBar(content: Text('${result ? "De acordo" : "Não concorda"}'))); 
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) { //Sem a arrow function =>
        return ListTile( //Permite usar uma função ontap e executar funções
          title: Text(todos[index].title),
          onTap: () => _showResponseFromNextPage(context, index),//Executando o ontap
        );
      },
    );
  }

}