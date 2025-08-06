import 'package:flutter/material.dart';
import 'jogador.dart';

class RankingPage extends StatelessWidget {
  final List<Jogador> jogadores;

  const RankingPage({super.key, required this.jogadores});

  @override
  Widget build(BuildContext context) {
    List<Jogador> ordenados = [...jogadores]..sort((a, b) => b.fichas.compareTo(a.fichas));

    return Scaffold(

      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            SizedBox(height: 8),

            Image.asset("assets/images/chips.png"),
            
            SizedBox(height: 8),

            Text('RANKING',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: 8),


            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: ordenados.length,
                      itemBuilder: (context, index) {
                        final jogador = ordenados[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.03), 
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ListTile(
                              leading: Text('${index + 1}º', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                              title: Text(jogador.nome , style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                              trailing: Text('${_formatFichas(jogador.fichas)} FICHAS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),),
                            )
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
