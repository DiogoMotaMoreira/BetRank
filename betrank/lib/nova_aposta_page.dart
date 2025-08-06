import 'package:flutter/material.dart';
import 'jogador.dart';


class NovaApostaPage extends StatefulWidget {
  final List<Jogador> jogadores;

  const NovaApostaPage({super.key, required this.jogadores});

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
      backgroundColor: Colors.transparent,


      body: 
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            SizedBox(height: 8),

            Image.asset("assets/images/chips.png"),
            
            SizedBox(height: 8),

            Text('NEW BET',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: 8),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
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
                  DropdownButtonFormField<Jogador>(
                    hint: Text(
                      'JOGADOR A',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 103, 103, 103),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    dropdownColor: Color(0xFF42008D).withOpacity(0.8),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    value: jogadorA,
                    onChanged: (value) {
                      setState(() {
                        jogadorA = value;
                      });
                    },
                    items: widget.jogadores.map((j) {
                      return DropdownMenuItem(
                        value: j,
                        child: Center(
                          child: Text(
                            j.nome,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 8,),

                  DropdownButtonFormField<Jogador>(
                    hint: Text(
                      'JOGADOR B',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 103, 103, 103),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    dropdownColor: Color(0xFF42008D).withOpacity(0.8),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    value: jogadorB,
                    onChanged: (value) {
                      setState(() {
                        jogadorB = value;
                      });
                    },
                    items: widget.jogadores.map((j) {
                      return DropdownMenuItem<Jogador>(
                        value: j,
                        child: Center(
                          child: Text(
                            j.nome,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 8,),

                  TextField(
                    textAlign: TextAlign.center,
                    controller: _valorController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      label: Align(
                         alignment: Alignment.center,
                          child: Text(
                            'MONTANTE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16, color: const Color.fromARGB(255, 103, 103, 103),
                              ),
                            ),
                          ),
                        fillColor: Colors.black.withOpacity(0.2),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                  ),
                ],
              ),
            ),

            
            SizedBox(height: 16),

            

              
            Container(
              padding: EdgeInsets.all(12),
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
                  ElevatedButton(
                    onPressed: () => _registarVencedor(jogadorA),
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
                    child: Text(
                      'JOGADOR A VENCEU',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
            SizedBox(height: 8),
          
            Container(
              padding: EdgeInsets.all(12),
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
                  ElevatedButton(
                    
                    onPressed: () => _registarVencedor(jogadorB),
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
                    child: Text(
                      'JOGADOR B VENCEU',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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
