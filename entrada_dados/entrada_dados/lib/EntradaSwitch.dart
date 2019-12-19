import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

           SwitchListTile(
             title: Text("Receber notificações?"),
             value: _escolhaUsuario,
             onChanged: (bool valor){
               setState(() {
                 _escolhaUsuario = valor;
               });
             }
           ),
           RaisedButton(
             child: Text(
               "Salvar",
               style: TextStyle(fontSize: 20),
             ),
             color: Colors.blueGrey,
             textColor: Colors.white,
             onPressed: (){
               if (_escolhaUsuario) {
                 print("Escolha ativar notificacoes");
               } else {
                 print("Escolha nao ativar notificacoes");
               }
             },
           )

            /*Switch(
             value: _escolhaUsuario,
             onChanged: (bool valor){
              setState(() {
                _escolhaUsuario = valor;
              });
             },
           ),
            Text("Receber notificações?")*/

          ],
        ),
      ),
    );
  }
}
