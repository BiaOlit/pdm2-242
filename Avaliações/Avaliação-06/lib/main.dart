
import 'package:flutter/material.dart';
import 'app/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação entre Telas',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TelaIni(), // A tela inicial que será exibida primeiro
    );
  }
}