import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomBarWithExpandableFAB(),
    );
  }
}

class BottomBarWithExpandableFAB extends StatefulWidget {
  const BottomBarWithExpandableFAB({super.key});

  @override
  State<BottomBarWithExpandableFAB> createState() =>
      _BottomBarWithExpandableFABState();
}

class _BottomBarWithExpandableFABState
    extends State<BottomBarWithExpandableFAB> {
  bool _isExpanded = false;

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAB com Botões Acima')),
      body: const Center(child: Text('Conteúdo da tela')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 80,
        height: 250, // aumenta altura total para suportar espaçamento maior
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Botão Mensagem
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: _isExpanded ? 140 : 40,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isExpanded ? 1 : 0,
                child: FloatingActionButton(
                  mini: true,
                  heroTag: "message",
                  onPressed: () {
                    print("Mensagem");
                  },
                  child: const Icon(Icons.message),
                ),
              ),
            ),

            // Botão Ligação
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: _isExpanded ? 90 : 40, // aumentamos o espaçamento aqui
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isExpanded ? 1 : 0,
                child: FloatingActionButton(
                  mini: true,
                  heroTag: "call",
                  onPressed: () {
                    print("Ligação");
                  },
                  child: const Icon(Icons.call),
                ),
              ),
            ),

            // FAB Principal (Botão de +)
            Positioned(
              bottom: 16,
              child: FloatingActionButton(
                heroTag: "main",
                onPressed: _toggleMenu,
                shape: const CircleBorder(),
                child: Icon(_isExpanded ? Icons.close : Icons.add),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            const SizedBox(width: 40), //Fab Space
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: const Icon(Icons.person), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
