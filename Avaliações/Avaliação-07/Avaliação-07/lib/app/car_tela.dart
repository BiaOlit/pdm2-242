import 'package:flutter/material.dart';
import 'finalizar_compra.dart';

class CarrinhoTela extends StatelessWidget {
  final List<Map<String, String>> carrinho;
  final Function(Map<String, String>) removerDoCarrinho;

  CarrinhoTela({required this.carrinho, required this.removerDoCarrinho});

  @override
  Widget build(BuildContext context) {
    double total = carrinho.length * 500.00; // Simulação de preço fixo por item

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        backgroundColor: Colors.green.shade700,
      ),
      body: carrinho.isEmpty
          ? Center(child: Text('Seu carrinho está vazio!', style: TextStyle(fontSize: 18)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carrinho.length,
                    itemBuilder: (context, index) {
                      final produto = carrinho[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text(produto['nome']!, style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(produto['descricao']!),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => removerDoCarrinho(produto),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Total: R\$${total.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FinalizarCompraTela(total: total)),
                          );
                        },
                        child: Text('Finalizar Compra', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
