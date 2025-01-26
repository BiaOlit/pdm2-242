// MAIN.DART


import 'package:flutter/material.dart';
import 'app/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alugaí',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TelaInicial(), // A tela inicial que será exibida primeiro
    );
  }
}
