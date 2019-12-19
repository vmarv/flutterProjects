import 'package:flutter/material.dart';
import 'package:top_noticias/Api.dart';
import 'package:top_noticias/Noticia.dart';

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
  Widget build(BuildContext context) {

    return FutureBuilder<List<Noticia>>(
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

              return ListView.builder(
                  itemBuilder: (context, index){

                    List<Noticia> noticias = snapshot.data;
                    Noticia noticia = noticias[index];

                    return Card(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(noticia.imagem)
                                    //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBAZSNnvI72t7OmlS56CS0iiUoi-EBi8xVy5S-zTZopw5kP9Tj&s"
                                  )
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Text(noticia.titulo),
                              subtitle: Text(noticia.descricao),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  /*separatorBuilder: (contex, index) => Divider(
                    height: 10,
                    color: Colors.red,
                  ),*/
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
