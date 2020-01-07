import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Numeros extends StatefulWidget {
  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {

  AudioCache _audioCache = AudioCache(prefix: "audios/");

  _executar(String nomeAudio){
    _audioCache.play("$nomeAudio.mp3");
  }

  @override
  void initState() {
    super.initState(); // ja copiar todos os audios para o cache pra n dar delay
    _audioCache.loadAll(["1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3", "6.mp3"]);
  }

  @override
  Widget build(BuildContext context) {
    //double largura = MediaQuery.of(context).size.width; // captura a largura do dispositivo
    //double altura = MediaQuery.of(context).size.height; // captura a altura

    return GridView.count(
      crossAxisCount: 2,
      //scrollDirection: Axis.horizontal,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2, // pega automatico o aspect ratio
      children: <Widget>[
        GestureDetector(
          onTap: (){
            _executar("1");
          },
          child: Image.asset("assets/imagens/1.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("2");
          },
          child: Image.asset("assets/imagens/2.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("3");
          },
          child: Image.asset("assets/imagens/3.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("4");
          },
          child: Image.asset("assets/imagens/4.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("5");
          },
          child: Image.asset("assets/imagens/5.png"),
        ),
        GestureDetector(
          onTap: (){
            _executar("6");
          },
          child: Image.asset("assets/imagens/6.png"),
        ),
      ],
    );
  }
}
