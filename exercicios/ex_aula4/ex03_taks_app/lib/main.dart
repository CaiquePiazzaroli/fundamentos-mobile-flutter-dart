import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task {
  String title;
  bool isDone;

  Task(this.title, this.isDone);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Notas de Tarefas',
      home: TaskScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task('Estudar Flutter', false),
    Task('Fazer exercícios físicos', true),
    Task('Ler um livro', false),
  ];

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informação'),
          content: Text('Você está no App de Notas de Tarefas'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Fechar'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tarefas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(tasks[index].title),
                    trailing: Checkbox(
                      value: tasks[index].isDone,
                      onChanged: (value) {
                        setState(() {
                          tasks[index].isDone = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                // ação do botão
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Botão pressionado!')),
                );
              },
              child: Text('Confirmar Tarefas'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInfoDialog,
        child: Icon(Icons.info),
      ),
    );
  }
}
