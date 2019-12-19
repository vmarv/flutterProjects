import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.red, width: 10)

                ),

                labelText: "Pesquisar psdor:"
              ),
              //enabled: false,
              //maxLength: 5,
              //maxLengthEnforced: false,
              style: TextStyle(
                fontSize: 25,
                color: Colors.green
              ),
              //obscureText: true,
              /*onChanged: (String texto){
                print("valor digitado: " + texto);
              },*/
              onSubmitted: (String texto){
                print("Valor digitado: " + texto);
              },
              controller: _textEditingController,
            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: (){
              print("Valor digitado: " + _textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}
