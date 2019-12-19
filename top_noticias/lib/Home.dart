import 'package:flutter/material.dart';
import 'package:top_noticias/CustomSearchDelegate.dart';
import 'package:top_noticias/Biblioteca.dart';
import 'package:top_noticias/EmAlta.dart';
import 'package:top_noticias/Inicio.dart';
import 'package:top_noticias/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio( _resultado ),
      //EmAlta(),
      //Inscricao(),
      //Biblioteca(),
    ];

    return Scaffold(
      backgroundColor: Color(0xfff9f0e1),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.redAccent,
        title: Image.asset(
          "images/logo.png",
          width: 180,
          //height: 40,
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
              );
              setState(() {
                _resultado = res;
              });
              //print("Resultado: digitado: " + res);
            },
          ),

        ],
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: telas[_indiceAtual],
      ),

      /*bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
                title: Text("Inicio"),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.red,
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
                title: Text("Inscrções"),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.green,
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)
            ),
          ]
      ),*/
    );
  }
}
