import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "A alegria de fazer o bem é a única felicidade verdadeira.",
    "A alegria de saber que você existe faz-me forte para suportar a tristeza de sua ausência.",
    "Dormi e sonhei que a vida era só alegria, despertei e vi que era também felicidade quando descobri a sua amizade!",
    "Uma das alegrias da amizade é saber em quem confiar.",
    "Aquele que nunca viu a tristeza, nunca reconhecerá a alegria.",
    "Saber encontrar a alegria na alegria dos outros, é o segredo da felicidade.",
    "A alegria de ver e entender é o mais perfeito dom da natureza.",
    "A virtude, o estudo e a alegria são três irmãos que não devem viver separados.",
    "Se a beleza constituísse o único mérito das mulheres, às feias só restaria enforcar-se.",
    "A modéstia está para a virtude como o véu está para a beleza.",
    "Todos somos belos se nos amarmos sem preconceito ou julgamento.",
    "Mulher feliz é mulher bonita. É sempre na felicidade que reside sua maior beleza.",
    "Uma alegria tumultuosa anuncia uma felicidade medíocre e breve.",
    "Faça dos seus sonhos a inspiração que precisa para os realizar."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber)
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            RaisedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              color: Colors.green,
              onPressed: _gerarFrase,
            )
          ],
        ),
      ),
    );
  }
}
