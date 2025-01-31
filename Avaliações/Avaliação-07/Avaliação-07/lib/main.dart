//Beatriz de Oliveira Teixeira e Matheus Pereira Menezes
import 'package:flutter/material.dart';
import 'app/produtos_tela.dart';
import 'app/car_tela.dart';

void main() {
  runApp(Alugai());
}

class Alugai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alugaí',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade400,

      ),
      home: TelaIni(),
    );
  }
}

class TelaIni extends StatefulWidget {
  @override
  _TelaIniState createState() => _TelaIniState();
}

class _TelaIniState extends State<TelaIni> {
  List<Map<String, String>> carrinho = [];

  void adicionarAoCarrinho(Map<String, String> produto) {
    setState(() {
      carrinho.add(produto);
    });
  }

  void removerDoCarrinho(Map<String, String> produto) {
    setState(() {
      carrinho.remove(produto);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
    PreferredSizeWidget _buildAppBar(BuildContext context){
      return AppBar(
        title: Text('Alugaí', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue.shade700, Colors.green.shade400]),
          ),
        ),
    
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarrinhoTela(
                    carrinho: carrinho,
                    removerDoCarrinho: removerDoCarrinho,
                  ),
                ),
              );
            },
          ),
        ],
      );
    }
Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCategoryCard(
            icon: Icons.tv,
            title: 'Televisores',
            context: context,
            categoria: 'Televisores',
          ),
          _buildCategoryCard(
            icon: Icons.computer,
            title: 'Computadores',
            context: context,
            categoria: 'Computadores',
          ),
          _buildCategoryCard(
            icon: Icons.phone_android,
            title: 'Celulares e Tablets',
            context: context,
            categoria: 'Celulares e Tablets',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({required IconData icon, required String title, required BuildContext context, required String categoria}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade700, size: 40),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.green.shade700),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProdutosTela(
                categoria: categoria,
                adicionarAoCarrinho: adicionarAoCarrinho,
              ),
            ),
          );
        },
      ),
    );
  }
}
