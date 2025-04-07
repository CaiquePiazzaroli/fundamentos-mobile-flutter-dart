import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de Card')),
        body: Center(
          child: _buildCard(), // Usando a função que retorna um Widget
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: SizedBox(
        height: 210,
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  '1625 Main Street',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('MyCity, CA 99984'),
                leading: Icon(Icons.restaurant_menu, color: Colors.blue),
              ),
      
              const Divider(), // Linha divisória
      
              ListTile(
                title: const Text(
                  '(408) 555-1212',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.contact_phone, color: Colors.blue),
              ),
      
              ListTile(
                title: const Text('costa@example.com'),
                leading: Icon(Icons.contact_mail, color: Colors.blue),
              ),
              // Você pode adicionar mais ListTiles ou widgets aqui
            ],
          ),
        ),
      ),
    );
  }
}
