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

    //String sql = "SELECT * FROM usuarios WHERE idade >= 20 OR idade <= 50";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 20 AND 40";
    //String sql = "SELECT * FROM usuarios WHERE idade IN (20,50)";
    //String sql = "SELECT * FROM usuarios WHERE nome = 'vinicius' ";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE 'Ana%' ";
    //String filtro = "ni";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%" + filtro + "%' ";
    //String sql = "SELECT * FROM usuarios WHERE 1 = 1 ORDER BY idade DESC LIMIT 3";
    String sql = "SELECT * FROM usuarios";
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

  _recuperarUsuarioPeloId(int id) async {

    Database bd = await _recuperarBancoDados();

    List usuarios = await bd.query(
      "usuarios",
      columns: ["id", "nome", "idade"],
      where: "id = ?",
      whereArgs: [id]
    );

    for(var usuario in usuarios) {
      print(""
          "item id: " + usuario['id'].toString() +
          " / nome: " + usuario['nome'] +
          " / idade: " + usuario['idade'].toString()
      );
    }

  }


  _excluirUsuario(int id) async {

    Database bd = await _recuperarBancoDados();

    int retorno = await bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );

    print("Qtd removida: $retorno");
  }

  _atualizarUsuario(int id) async {

    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Julio",
      "idade" : 22
    };

    int retorno = await bd.update(
      "usuarios",
      dadosUsuario,
      where: "id = ?",
      whereArgs: [id]
    );

    print("Qtd alterada: $retorno");
  }


  @override
  Widget build(BuildContext context) {

    //_recuperarBancoDados();  // Chama o metodo que abre e cria o Banco de Dados

    //_salvar();
    _listarUsuarios();
    //_recuperarUsuarioPeloId(5);
    //_excluirUsuario(8);
    //_atualizarUsuario(7);

    return Container();
  }
}
