import 'package:flutter/material.dart';
import 'jogador.dart';

class RankingPage extends StatelessWidget {
  final List<Jogador> jogadores;

  RankingPage({required this.jogadores});

  @override
  Widget build(BuildContext context) {
    List<Jogador> ordenados = [...jogadores]..sort((a, b) => b.fichas.compareTo(a.fichas));

    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking',),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        ),

      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: ordenados.length,
                      itemBuilder: (context, index) {
                        final jogador = ordenados[index];
                        return ListTile(
                          leading: Text('${index + 1}º', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          title: Text(jogador.nome , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          trailing: Text('${_formatFichas(jogador.fichas)} FICHAS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatFichas(int fichas) {
  if (fichas >= 1000000000) {
    return '${(fichas / 1000000000).toStringAsFixed(fichas % 1000000000 == 0 ? 0 : 1)}B';
  } else if (fichas >= 1000000) {
    return '${(fichas / 1000000).toStringAsFixed(fichas % 1000000 == 0 ? 0 : 1)}M';
  } else if (fichas >= 1000) {
    return '${(fichas / 1000).toStringAsFixed(fichas % 1000 == 0 ? 0 : 1)}K';
  } else {
    return fichas.toString();
  }
}
