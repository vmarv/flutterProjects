import 'package:exibir_json_listview/Api.dart';
import 'package:exibir_json_listview/User.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BuildListView(),
  )
);

// classe BuildListView -----------
class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {

  var users = List<User>();

  _getUsers() {
    API.getUsers().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  _buildListViewState() {
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuarios"),
      ),

      body: listaUsuarios(),
    );
  }

  //Metodo listaUsuraios() ======
  listaUsuarios(){
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(users[index].name, style: TextStyle(fontSize: 20, color: Colors.blue),),
        );
      },
    );
  }
  //Fim listaUsuraios() ========

}  // Fim fa classe BuildListView ---------------

