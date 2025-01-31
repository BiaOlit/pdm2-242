import 'package:flutter/material.dart';

class FinalizarCompraTela extends StatefulWidget {
  final double total;

  FinalizarCompraTela({required this.total});

  @override
  _FinalizarCompraTelaState createState() => _FinalizarCompraTelaState();
}

class _FinalizarCompraTelaState extends State<FinalizarCompraTela> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String endereco = '';
  String metodoPagamento = 'Cartão de Crédito';
  bool compraFinalizada = false;

  void finalizarCompra() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        compraFinalizada = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finalizar Compra'), backgroundColor: Colors.blue.shade800),
      body: compraFinalizada ? _buildCompraFinalizada() : _buildFormulario(),
    );
  }

  Widget _buildFormulario() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total da compra: R\$${widget.total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green.shade700)),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome Completo', border: OutlineInputBorder()),
              validator: (value) => value!.isEmpty ? 'Digite seu nome' : null,
              onChanged: (value) => nome = value,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Endereço de Entrega', border: OutlineInputBorder()),
              validator: (value) => value!.isEmpty ? 'Digite seu endereço' : null,
              onChanged: (value) => endereco = value,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: metodoPagamento,
              decoration: InputDecoration(border: OutlineInputBorder()),
              items: ['Cartão de Crédito', 'Boleto', 'PIX'].map((String metodo) {
                return DropdownMenuItem<String>(
                  value: metodo,
                  child: Text(metodo),
                );
              }).toList(),
              onChanged: (value) => setState(() => metodoPagamento = value!),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: finalizarCompra,
                child: Text('Confirmar Pedido', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompraFinalizada() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 20),
            Text('Compra Finalizada!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
            SizedBox(height: 16),
            Text('Seu pedido foi confirmado e será enviado em breve.', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Voltar à Loja', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
