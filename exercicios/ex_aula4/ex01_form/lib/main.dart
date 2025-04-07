import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("My Form")), body: FormPage()),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() {
    return _FormState();
  }
}

class _FormState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: "Name",
              icon: Icon(Icons.person),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _nameController,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Phone",
              icon: Icon(Icons.phone),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _phoneController,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Date of Birth",
              icon: Icon(Icons.date_range),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _dobController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar( //Necessário para exibir o Snackbar
                    SnackBar(
                      content: Text("Name ${_nameController.text} - Phone ${_phoneController.text} - Date of Birth ${_dobController.text}"),
                      action: SnackBarAction(
                        label: 'Desfazer',
                        onPressed: () {
                          print("Desfazer ação");
                        },
                      ),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
