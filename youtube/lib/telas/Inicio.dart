import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa){
    Api  api = Api();
    //api.pesquisar("");

    return api.pesquisar(pesquisa);
  }

  @override
  void initState() {
    super.initState();
    print("Chamado 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Chamado 2 - didChangeDepedencies");
  }

  @override
  void didUpdateWidget(Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Chamado 2 - didUpdateDepedencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("Chamado 4 - Dispose");
  }

  @override
  Widget build(BuildContext context) {

    print("Chamado 3 - Build");

    return FutureBuilder<List<Video>>(
      future: _listarVideos( widget.pesquisa ), //Metodo que vai retornar os videos
      // ignore: missing_return
      builder: (context, snapshot){ // snapshot = são como se fosse o resultado
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){ // se existe dados a serem exibidos

              return ListView.separated(
                itemBuilder: (context, index){

                  List<Video> videos = snapshot.data;
                  Video video = videos[index];

                  return GestureDetector(
                    onTap: (){
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API,
                        videoId: video.id,
                        autoPlay: true,
                        fullScreen: false
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.imagem)
                              )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (contex, index) => Divider(
                  height: 3,
                  color: Colors.red,
                ),
                itemCount: snapshot.data.length
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
        }
      },
    );
  }
}
