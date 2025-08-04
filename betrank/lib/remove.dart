import 'package:flutter/material.dart';
import 'jogador.dart';

class HomePage extends StatefulWidget {
  final List<Jogador> jogadores;

  HomePage({required this.jogadores});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _fichasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Jogadores'),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome do jogador',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _fichasController,
                        decoration: InputDecoration(
                          labelText: 'Fichas iniciais',
                          prefixIcon: Icon(Icons.monetization_on),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.add),
                          label: Text('Adicionar Jogador'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            String nome = _nomeController.text.trim();
                            int? fichas = int.tryParse(_fichasController.text.trim());

                            if (nome.isNotEmpty && fichas != null) {
                              setState(() {
                                widget.jogadores.add(Jogador(nome: nome, fichas: fichas));
                              });

                              _nomeController.clear();
                              _fichasController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28),
              Text(
                'Lista de Jogadores',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[700],
                ),
              ),
              SizedBox(height: 12),
              widget.jogadores.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Center(
                        child: Text(
                          'Nenhum jogador adicionado.',
                          style: TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.jogadores.length,
                      itemBuilder: (context, index) {
                        final jogador = widget.jogadores[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigo[200],
                              child: Text(
                                jogador.nome.isNotEmpty ? jogador.nome[0].toUpperCase() : '?',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: Text(
                              jogador.nome,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text('${jogador.fichas} fichas'),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red[400]),
                              onPressed: () {
                                setState(() {
                                  widget.jogadores.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}