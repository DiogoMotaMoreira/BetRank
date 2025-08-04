import 'package:flutter/material.dart';
import 'jogador.dart';

class RankingPage extends StatelessWidget {
  final List<Jogador> jogadores;

  RankingPage({required this.jogadores});

  @override
  Widget build(BuildContext context) {
    List<Jogador> ordenados = [...jogadores]..sort((a, b) => b.fichas.compareTo(a.fichas));

    return Scaffold(
      appBar: AppBar(title: Text('Ranking')),
      body: ListView.builder(
        itemCount: ordenados.length,
        itemBuilder: (context, index) {
          final jogador = ordenados[index];
          return ListTile(
            leading: Text('${index + 1}º'),
            title: Text(jogador.nome),
            trailing: Text('${jogador.fichas} fichas'),
          );
        },
      ),
    );
  }
}
