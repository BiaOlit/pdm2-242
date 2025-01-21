import 'package:flutter/material.dart';

class TelaIni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar para a Tela2
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tela2()),
            );
          },
          child: Text('Ir para Segunda Tela'),
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Voltar para a Tela1
            Navigator.pop(context);
          },
          child: Text('Voltar para a Tela Inicial'),
        ),
      ),
    );
  }
}