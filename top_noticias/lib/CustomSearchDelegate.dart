import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //print("Pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //print("disitado: " + query);

    List<String> lista = List();

    if(query.isNotEmpty){
      lista = [
        "Android", "Android navegação", "IOS", "Jogos"
      ].where(
              (texto) => texto.toLowerCase().startsWith( query.toLowerCase() )
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado!"),
      );
    }


  }

}