import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCep = TextEditingController();

  String _resultado = "Resultado";

  _recuperarCep() async {

    //String cepDigitado = _controllerCep.text;
    //String url = "https://viacep.com.br/ws/${cepDigitado}/json/";
    String url = "https://vimodev.000webhostapp.com/api/v1/estoque/mostrar";

    http.Response response;    
    
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);

    //String produto = retorno["dados"][1]["produto"];
    //String logradouro = retorno["logradouro"];
    //String complemento = retorno["complemento"];
    //String bairro = retorno["bairro"];
    //String localidade = retorno["localidade"];

    print(retorno);
    //print(produto);

    setState(() {

      //_resultado = "${logradouro}, ${complemento}, ${bairro}, ${localidade}";
    });

    //print("reposta: " + response.body);

    //print("reposta: " + response.statusCode.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Consumo de serviços web"),
      ),

      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o cep: ex: 58000500"
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllerCep,

            ),

            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            ),

            Text(_resultado)
          ],
        ),
      ),
    );
  }
}
