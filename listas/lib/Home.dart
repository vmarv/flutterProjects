import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){
    _itens = []; // pra n repetir a lista toda embaixo
    for(int i=0; i <= 10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} lorem ipsum teste";
      item["descricao"] = "Descricao ${i} lorem ipsum teste";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {

            //Map<String, dynamic> item = _itens[indice];
            //print("item ${item["titulo"]}");

            return ListTile(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text(_itens[indice]["titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange
                      ),
                      content: Text(_itens[indice]["descricao"]),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: (){
                            print("Selecionado sim");
                            Navigator.pop(context); //fecha Alert
                          },
                          child: Text("Sim"),
                        ),
                        FlatButton(
                          onPressed: (){
                            print("Selecionado nao");
                            Navigator.pop(context); //fecha Alert
                          },
                          child: Text("Não"),
                        ),
                      ],
                      //backgroundColor: Colors.orange,
                    );
                  }
                );
                //print("Clique Ontap ${indice}");
              },
              /*onLongPress: (){
                print("Clique OnLong");
              },*/
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),
              );

            }
        ),
      ),
    );
  }
}
