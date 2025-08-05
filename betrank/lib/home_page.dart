
import 'package:flutter/material.dart';
import 'jogador.dart';


class HomePage extends StatefulWidget  {
  final List<Jogador> jogadores;

  HomePage({required this.jogadores});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variáveis
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _fichasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogadores',),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        ),

      backgroundColor: const Color.fromARGB(255, 19, 19, 19),

      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
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
                  TextField(
                    controller: _nomeController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'NOME',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: const Color.fromARGB(255, 103, 103, 103)),
                      fillColor: Color.fromARGB(255, 19, 19, 19),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      ),
                  ),

                  SizedBox(height: 8),

                  TextField(
                    controller: _fichasController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'FICHAS',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: const Color.fromARGB(255, 103, 103, 103)),
                      fillColor: Color.fromARGB(255, 19, 19, 19),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      ),
                  ),

                  SizedBox(height: 16),

                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 19, 19, 19),
                      padding:EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                    ),
                    
                    onPressed: (){
                    String nome  = _nomeController.text.trim();
                    int? fichas = int.tryParse(_fichasController.text.trim());

                    if (nome.isNotEmpty && fichas != null){
                      setState((){
                        widget.jogadores.add(Jogador(nome: nome, fichas: fichas));
                      });

                      _nomeController.clear();
                      _fichasController.clear();
                    }

                  }, child: Text('ADICIONAR JOGADOR', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
            ),

          

            Expanded(
              child: ListView.builder(
                itemCount: widget.jogadores.length,
                itemBuilder: (context, index){
                  final jogador = widget.jogadores[index];
                  return Card(
                    color: Colors.white,
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(jogador.nome, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      trailing: Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${_formatFichas(jogador.fichas)} FICHAS',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            widget.jogadores.removeAt(index);
                          });
                        }, 
                        icon: Icon(Icons.delete, color: Colors.red, size: 30,))
                      ],)
                    ),
                  );
                },
              ) 
            )

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