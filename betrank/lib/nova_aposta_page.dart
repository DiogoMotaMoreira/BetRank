import 'package:flutter/material.dart';
import 'jogador.dart';


class NovaApostaPage extends StatefulWidget {
  final List<Jogador> jogadores;

  NovaApostaPage({required this.jogadores});

  @override
  _NovaApostaPageState createState() => _NovaApostaPageState();

}

class _NovaApostaPageState extends State<NovaApostaPage> {
  Jogador? jogadorA;
  Jogador? jogadorB;
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Aposta',),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        ),

      backgroundColor: Colors.black,


      body: 
      Padding(
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
                children: [
                  DropdownButton<Jogador>(
                    hint: Text('Jogador A'),
                    value: jogadorA,
                    onChanged: (value) {
                      setState(() {
                        jogadorA = value;
                      });
                    },
                    items: widget.jogadores.map((j) {
                      return DropdownMenuItem(
                        value: j,
                        child: Text(j.nome),
                      );
                    }).toList(),
                  ),
                  DropdownButton<Jogador>(
                    hint: Text('Jogador B'),
                    value: jogadorB,
                    onChanged: (value) {
                      setState(() {
                        jogadorB = value;
                      });
                    },
                    items: widget.jogadores.map((j) {
                      return DropdownMenuItem(
                        value: j,
                        child: Text(j.nome),
                      );
                    }).toList(),
                  ),


                  TextField(
                    controller: _valorController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Valor da aposta'),
                  ),
                ],
              ),
            ),

            
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _registarVencedor(jogadorA),
                  child: Text('Venceu A'),
                ),
                ElevatedButton(
                  onPressed: () => _registarVencedor(jogadorB),
                  child: Text('Venceu B'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _registarVencedor(Jogador? vencedor) {
    int? valor = int.tryParse(_valorController.text.trim());

    if (jogadorA == null || jogadorB == null || jogadorA == jogadorB || vencedor == null || valor == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Verifica os dados da aposta!'),
      ));
      return;
    }

    setState(() {
      vencedor.fichas += valor;
      (vencedor == jogadorA ? jogadorB : jogadorA)!.fichas -= valor;
    });

    _valorController.clear();
    jogadorA = null;
    jogadorB = null;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Aposta registada!'),
    ));
  }
}
