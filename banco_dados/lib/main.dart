import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async { //Conexao com o BD

    final caminhoBancoDados = await getDatabasesPath(); //recupara o caminho do db
    final localBancoDados = join(caminhoBancoDados, "banco3.db"); // nome do db com o caminho

    var bd = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (db, dbVersaoRecente){
          String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
          db.execute(sql);
        }
    );

    return bd;
    //print("aberto: " + bd.isOpen.toString());
  }


  _salvar() async {

    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Ana Maria",
      "idade" : 20
    };
    int id = await bd.insert("usuarios", dadosUsuario);
    print("Salvo: $id " );

  }

  _listarUsuarios() async {

    Database bd = await _recuperarBancoDados();

    String sql = "SELECT * FROM usuarios WHERE idade >= 20 OR idade <= 50";
    List usuarios = await bd.rawQuery(sql);

    for(var usuario in usuarios) {
      print(""
          "item id: " + usuario['id'].toString() +
          " / nome: " + usuario['nome'] +
          " / idade: " + usuario['idade'].toString()
      );
    }

    //print("Usuarios: " + usuarios.toString());
  }


  @override
  Widget build(BuildContext context) {

    //_recuperarBancoDados();  // Chama o metodo que abre e cria o Banco de Dados

    //_salvar();
    _listarUsuarios();

    return Container();
  }
}
