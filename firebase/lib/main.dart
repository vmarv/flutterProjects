import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  //Firestore db = Firestore.instance;

  /*db.collection("usuarios").document("002").setData({ // tanto serve pra criar/salvar como pra atualizar
    "nome" : "Ana Maria",
    "idade" : "25"
  });
 
 db.collection("noticias").add({ // Gera o Document automatico ao salvar
   "titulo" : "Novo planeta é descobeto",
   "descricao" : "Texto de exemplo 2..."
 });

 DocumentReference ref = await db.collection("noticias").add({ // retorna o document gerado automaticamente
   "titulo" : "Ondas de calor em SP",
   "descricao" : "Texto de exemplo 3..."
 });

 print("item salvo: " + ref.documentID);

 db.collection("noticias").document("4LTP3wexXwDqQfTLKSFc").setData({
   "titulo" : "Ondas de calor em SP Alterado",
   "descricao" : "Texto de exemplo 3..."
 });*/ //Codigos de salvar e alterar

  //db.collection("usuarios").document("003").delete(); // Deletar registro


  /*DocumentSnapshot snapshot = await db.collection("usuarios").document("001").get(); // pega um registro

  var dados = snapshot.data;
  print("dados nome: " + dados["nome"] + " idade: " + dados["idade"]);*/


  /*QuerySnapshot querySnapshot = await db.collection("usuarios").getDocuments(); // Ver todos os registros

  for(DocumentSnapshot item in querySnapshot.documents){
    var dados = item.data;
    print("Dados usuarios: " + dados["nome"] + " - idade: " + dados["idade"]);
  }*/


 /* db.collection("usuarios").snapshots().listen( // Lista e qualquer alteração a lista é atualizada
      (snapshot){
        for(DocumentSnapshot item in snapshot.documents) {
          var dados = item.data;
          print("Dados usuarios: " + dados["nome"] + " - idade: " + dados["idade"]);
        }
      }
  );*/


 // Pesquisar texto
/*var pesquisa = "an";
 QuerySnapshot querySnapshot = await db.collection("usuarios")
     //.where("nome", isEqualTo: "marcelo")
     //.where("idade", isEqualTo: 31)
     //.where("idade", isGreaterThan: 15)
     //.where("idade", isLessThan: 30)
     //.orderBy("idade", descending: true)
     //.orderBy("nome", descending: false)
     //.limit(2) // limita a quantidade pra mostrar
     .where("nome", isGreaterThanOrEqualTo: pesquisa)
     .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff")
     .getDocuments();

 for(DocumentSnapshot item in querySnapshot.documents){
   var dados = item.data;
   print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
 }*/


// Autenticacao com firebase_auth
 //FirebaseAuth auth = FirebaseAuth.instance;

 // Criando usuario com email e senha
  /*String email = "jamilton@gmail.com";
  String senha = "123456";

  auth.createUserWithEmailAndPassword(email: email, password: senha).then((firebaseUser){
    print("Novo Usuario: Sucesso! email: " + firebaseUser.user.email);
  }).catchError((erro){
    print("Novo Usuario: ERRO email: " + erro.toString());
  });*/



  //auth.signOut(); // desloga usuario

  // Logando o usuario
  /*String email = "jamilton@gmail.com";
  String senha = "123456";

  auth.signInWithEmailAndPassword(email: email, password: senha).then((firebaseUser){
    print("Novo Usuario: Sucesso! email: " + firebaseUser.user.email);
  }).catchError((erro){
    print("Novo Usuario: ERRO email: " + erro.toString());
  });*/


  // ver usurio logado no momento
  /*FirebaseUser usuarioAtual = await auth.currentUser();

  if(usuarioAtual != null){ //logado
    print("Usuario atual logado email: " + usuarioAtual.email);
  } else { //deslogado
    print("Usuario atual deslogado");
  }*/


/*  // Autenticação com Google
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  _handleSignIn()
      .then((FirebaseUser user) => print(user))
      .catchError((e) => print(e));*/



 runApp(MaterialApp(
   home: Home(),
 ));
 
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _imagem;
  String _statusUpload = "Upload não iniciado";
  String _urlImagemRecuperada = null;

  Future _recuperarImagem(bool daCamera) async {

    File imagemSelecionada;
    if(daCamera){ //camera
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
    } else { //galeria
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = imagemSelecionada;
    });
  }

  Future _uploadImagem() async {

    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("fotos").child("foto1.jpg");

    // fazer o upload da imagem
    StorageUploadTask task = arquivo.putFile(_imagem); // StorageUploadTask task = necessario para controlar o progresso

    // controlar o progresso do upload
    task.events.listen((StorageTaskEvent storageEvent){
      if(storageEvent.type == StorageTaskEventType.progress){
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if(storageEvent.type == StorageTaskEventType.success) {
        setState(() {
          _statusUpload = "Upload realizado com sucesso.";
        });
      }
    });

    // recuperar a URL da imagem
    task.onComplete.then((StorageTaskSnapshot snapshot){
      _recuperarUrlImagem(snapshot);
    });

  }

  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    setState(() {
      _urlImagemRecuperada = url;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(_statusUpload),
            RaisedButton(
              child: Text("Camera"),
              onPressed: (){
                _recuperarImagem(true);
              },
            ),
            RaisedButton(
              child: Text("Galeria"),
              onPressed: (){
                _recuperarImagem(false);
              },
            ),
            GestureDetector(
              child: _imagem == null ? Container() : Image.file(_imagem),
              onDoubleTap: () {
                setState(() {
                  _imagem = null;
                });
              }
            ),
            _imagem == null ? Container() :
            RaisedButton(
              child: Text("Upload Storage"),
              onPressed: (){
                _uploadImagem();
              },
            ),
            _urlImagemRecuperada == null ? Container() : Image.network(_urlImagemRecuperada)
          ],
        ),
      ),
    );
  }
}


