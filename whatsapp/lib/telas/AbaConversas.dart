import 'package:flutter/material.dart';
import 'package:whatsapp/model/Conversa.dart';

class AbaConversas extends StatefulWidget {
  @override
  _AbaConversasState createState() => _AbaConversasState();
}

class _AbaConversasState extends State<AbaConversas> {

  List<Conversa> listaConversas = [
    Conversa(
      "Ana Clara",
      "Ola tudo bem?",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-979fa.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=239f9aab-8139-4bbd-bae4-9f19753ccde8"
        ),
    Conversa(
        "Pedro Silva",
        "Mana o nome da serie",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-979fa.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=ec3f32c3-1650-4528-a7ac-dd4d3e3ae4ea"
    ),
    Conversa(
        "Marcel Almeida",
        "Vamos sair hj?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-979fa.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=0f03bc35-bfe8-4576-b9f5-c348b9eb3270"
    ),
    Conversa(
        "Jose Renato",
        "Nao vai acreditar no q vou falar",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-979fa.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=460f4448-a78a-4671-98b7-cf75d23c26b0"
    ),
    Conversa(
        "Jamilton Damasceno",
        "Curso novo!! depois da uma olhada",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-979fa.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=d64c5dcd-8a1c-422b-a047-2909af546c8b"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaConversas.length,
      itemBuilder: (context, indice) {
        Conversa conversa = listaConversas[indice];
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(conversa.caminhoFoto),
          ),
          title: Text(
            conversa.nome,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            conversa.mensagem,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        );
      }
    );
  }
}
