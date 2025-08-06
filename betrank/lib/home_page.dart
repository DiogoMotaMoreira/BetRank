
import 'package:flutter/material.dart';
import 'jogador.dart';


class HomePage extends StatefulWidget  {
  final List<Jogador> jogadores;

  const HomePage({super.key, required this.jogadores});

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

      backgroundColor: Colors.transparent,

      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 8),

            Image.asset("assets/images/chips.png"),
            
            SizedBox(height: 8),

            Text('PLAYERS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: 8),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
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
                  TextField(
                    controller: _nomeController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'NOME',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: const Color.fromARGB(255, 103, 103, 103)),
                      fillColor: Colors.black.withOpacity(0.2),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      ),
                  ),

                  SizedBox(height: 8),

                  TextField(
                    controller: _fichasController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'FICHAS',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: const Color.fromARGB(255, 103, 103, 103)),
                      fillColor: Colors.black.withOpacity(0.2),
                      filled: true,
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        
                      ),
                      ),
                  ),

                  SizedBox(height: 16),

                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5E00A0).withOpacity(0.6),
                      shadowColor: Colors.black,
                      minimumSize: Size(double.infinity, 0), // ocupa largura máxima permitida
                      foregroundColor: Colors.white, // texto e ripple
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
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
                    fontSize: 16,
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
                    color: Colors.black.withOpacity(0.1),
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(jogador.nome, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                      trailing: Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${_formatFichas(jogador.fichas)} FICHAS',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color.fromARGB(150, 255, 255, 255)),
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            widget.jogadores.removeAt(index);
                          });
                        }, 
                        icon: Icon(Icons.delete, color: Colors.red, size: 25,))
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