import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();
  TextEditingController _controllerTarefa = TextEditingController();


  //Metodo para retornar o path / diretorio

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa(){
    String textDigitado = _controllerTarefa.text;

    //Salvar dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
      _salvarArquivo();
      _controllerTarefa.text = "";
    });
  }

  _salvarArquivo() async {

    var arquivo = await _getFile();

    //converter lista para Json
    String dados = json.encode(_listaTarefas);
    //-------------
    arquivo.writeAsString(dados); // vai salvar esses dados como uma string (escrever como uma string)

    //print("Caminho: " + diretorio.path);

  }

  _lerArquivo() async {
    try{
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  Widget criarItemLista(context, index){ // retorna o widget do itembuilder da listview

    final item = _listaTarefas[index]["titulo"];

    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){

        //recuperar último item excluído
        _ultimaTarefaRemovida = _listaTarefas[index];

        //remove item da lista
        _listaTarefas.removeAt(index);
        _salvarArquivo();

        //snackbar
        final snackbar = SnackBar(
          duration: Duration(seconds: 5),
          content: Text("Tarefa removida!"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: (){
              //insere novamente item removido na lista
              setState(() {
                _listaTarefas.insert(index, _ultimaTarefaRemovida);
              });
              _salvarArquivo();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);

      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_listaTarefas[index]["titulo"]),
        value: _listaTarefas[index]["realizada"],
        onChanged: (valorAlterado){
          setState(() {
            _listaTarefas[index]["realizada"] = valorAlterado;
            _salvarArquivo();
          });
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    //_salvarArquivo();
    //print("itens: " + _listaTarefas.toString());


    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Adicionar tarefa"),
                content: TextField(
                  controller: _controllerTarefa,
                  decoration: InputDecoration(
                    labelText: "Digite sua tarefa"
                  ),
                  onChanged: (text){

                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  FlatButton(
                    child: Text("Salvar"),
                    onPressed: (){
                      _salvarTarefa();
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            }
          );
        },
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: criarItemLista,
            ),
          )
        ],
      ),
    );
  }

}
