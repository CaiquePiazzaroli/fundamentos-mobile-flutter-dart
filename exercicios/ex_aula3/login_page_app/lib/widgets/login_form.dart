import 'package:flutter/material.dart';
import 'package:login_page_app/models/login.dart';
import 'package:login_page_app/pages/home_page.dart';

//Criando o State para armazenar os valores dos fieldTexts
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController =
      TextEditingController(); //Controlador do campo email
  final TextEditingController passwordController =
      TextEditingController(); //Controlador do campo password

  Login loginData = Login(); //Criando o objeto Login para armazenar os dados

  //Método que verifica usuário e senha do form
  _verifyLoginData() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == 'admin' && password == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        //Exibe o snackbar
        SnackBar(
          content: const Text('Wrong Password or Email!'),
          action: SnackBarAction(
            label: 'Action', //Botao do lado direito
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 30)),
          Image(
            width: 200,
            image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia'
              '/commons/thumb/4/44/Google-flutter-logo.svg/2560px-Google-flutter-logo.svg.png',
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 20)), //Padding
          //SizedBox ajuda a controlar o tamanho do textField
          //Email Textfield
          SizedBox(
            width: 340,
            child: TextField(
              controller:
                  emailController, //Definindo o controlador que contém as informações do TextField
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              onSubmitted: (value) => print(value),
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 8)), //Padding
          //Password TextField
          SizedBox(
            width: 340,
            child: TextField(
              controller: passwordController, // Usa o controlador
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 6)), //Padding
          //New password
          TextButton(
            onPressed: () => {print("Nova senha")},
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 6)),

          //Button login
          SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
              ),
              onPressed: () => {_verifyLoginData()},
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 100)), //Padding
          //New Account login
          TextButton(
            onPressed: () => {print("Nova Conta")},
            child: Text(
              "New user? Create account",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
