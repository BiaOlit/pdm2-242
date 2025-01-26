// Beatriz de Oliveira Teixeira e Matheus Pereira Menezes

import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.tv),
            title: Text('Televisores'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdutosTela(categoria: 'Televisores')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text('Computadores'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdutosTela(categoria: 'Computadores')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Celulares e Tablets'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdutosTela(categoria: 'Celulares e Tablets')),
              );
            },
          ),
        ],
      ),
    );
  }
}
class ProdutosTela extends StatelessWidget {
  final String categoria;

  ProdutosTela({required this.categoria});

  List<Map<String, String>> getProdutos() {
    switch (categoria) {
      case 'Televisores':
        return [
          {
            'nome': 'Samsung Smart TV 50"',
            'descricao': 'Boa qualidade de imagem e interface intuitiva.'
          },
          {
            'nome': 'TCL Smart TV 45"',
            'descricao': 'TV muito boa com ótima resolução.'
          },
        ];
      case 'Computadores':
        return [
          {
            'nome': 'Notebook Dell 13',
            'descricao': 'Portátil e perfeito para produtividade.'
          },
          {
            'nome': 'iMac 27"',
            'descricao': 'Desempenho incrível para trabalhos criativos.'
          },
        ];
      case 'Celulares e Tablets':
        return [
          {
            'nome': 'iPhone 14 Pro',
            'descricao': 'Iphone incrível com desempenho excepcional.'
          },
          {
            'nome': 'Samsung Galaxy Tab S8',
            'descricao': 'Tablet poderoso para trabalho e entretenimento.'
          },
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
        title: Text('Produtos - $categoria'),
      ),
      body: ListView(
        children: produtos.map((produto) {
          return ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('${produto['nome']}'),
            subtitle: Text('${produto['descricao']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesProduto(nome: '${produto['nome']}'),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}



class DetalhesProduto extends StatelessWidget {
  final String nome;

  DetalhesProduto({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nome,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Para mais detalhes entre em contato pelo número a seguir: (85) 99768-5690.',style: TextStyle(fontSize: 16), ),
            SizedBox(height: 32),
           
          ],
        ),
      ),
    );
  }
}

