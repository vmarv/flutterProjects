import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Botton"),
      ),

      body: Text("Conteudo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        /*shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),*/
        /*child: Icon(Icons.add),
        onPressed: (){
          print("Botao Pressionado");
        },*/
      ),

      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(), // o botto bar fica com as linhas iguais ao do Float button
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.menu),
            )
          ],
        ),
      ),
    );
  }
}
