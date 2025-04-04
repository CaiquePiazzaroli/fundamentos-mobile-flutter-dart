import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Forms no flutter')),
        body: FormExample(),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FormExampleState();
  }
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final TextEditingController _textController = TextEditingController(); // Controlador para pegar o valor do campo
   final TextEditingController _passwordController = TextEditingController(); // Controlador para pegar o valor do campo de password

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //Serve para identificar o campo em qualquer lugar do código
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _textController, // Associa o controlador ao campo
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String? value) { //Define o que é valido ou nao para o campo de input
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(hintText: 'Enter your password'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password!';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  if(_textController.text.toLowerCase() == "Caique".toLowerCase() && _passwordController.text == '1234') {
                    print('Usuario Logado com sucesso!');
                    print('Bem vindo, ${_textController.text}');
                  } else {
                    print('Usuario ou senha incorretos');//Printa o texto
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
