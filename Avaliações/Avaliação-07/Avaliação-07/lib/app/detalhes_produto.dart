import 'package:flutter/material.dart';

class DetalhesProduto extends StatefulWidget {
  final Map<String, String> produto;
  final Function(Map<String, String>) adicionarAoCarrinho;

  DetalhesProduto({required this.produto, required this.adicionarAoCarrinho});

  @override
  _DetalhesProdutoState createState() => _DetalhesProdutoState();
}

class _DetalhesProdutoState extends State<DetalhesProduto> {
  bool adicionado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto['nome']!), backgroundColor: Colors.green.shade700
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.produto['nome']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
             SizedBox(height: 16),
            Text(widget.produto['descricao']!, style: TextStyle(fontSize: 18)),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  padding: EdgeInsets.symmetric(horizontal:20, vertical:12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),

                onPressed: () {
                  setState(() {
                    adicionado = true;
                  });
                  widget.adicionarAoCarrinho(widget.produto);
                },
                child: Text(adicionado ? 'Adicionado ao Carrinho' : 'Adicionar ao Carrinho'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
