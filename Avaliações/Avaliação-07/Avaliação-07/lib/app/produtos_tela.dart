import 'package:flutter/material.dart';
import 'detalhes_produto.dart';

class ProdutosTela extends StatefulWidget {
  final String categoria;
  final Function(Map<String, String>) adicionarAoCarrinho;

  ProdutosTela({required this.categoria, required this.adicionarAoCarrinho});

  @override
  _ProdutosTelaState createState() => _ProdutosTelaState();
}

class _ProdutosTelaState extends State<ProdutosTela> {
  List<Map<String, String>> getProdutos() {
    switch (widget.categoria) {
      case 'Televisores':
        return [
          {'nome': 'Samsung Smart TV 50"', 'descricao': 'Imagem em 4K.'},
          {'nome': 'TCL Smart TV 45"', 'descricao': 'Ótima resolução.'},
        ];
      case 'Computadores':
        return [
          {'nome': 'Notebook Dell XPS', 'descricao': 'Poderoso e portátil.'},
          {'nome': 'iMac 27"', 'descricao': 'Ótimo para designers.'},
        ];
      case 'Celulares e Tablets':
        return [
          {'nome': 'iPhone 14 Pro', 'descricao': 'Câmera incrível.'},
          {'nome': 'Galaxy Tab S8', 'descricao': 'Ótimo desempenho.'},
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final produtos = getProdutos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos - ${widget.categoria}'),
        backgroundColor: Colors.blue.shade800,
      ),
     body: ListView(
        padding: EdgeInsets.all(12),
        children: produtos.map((produto) {
          return Card(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.green.shade700),
              title: Text(produto['nome']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(produto['descricao']!),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesProduto(
                      produto: produto,
                      adicionarAoCarrinho: widget.adicionarAoCarrinho,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
