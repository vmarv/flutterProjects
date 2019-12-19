import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:top_noticias/Noticia.dart';

const CHAVE_YOUTUBE_API = "AIzaSyApqTQ3KfEhBozXck7tk4UyiQj9cNoYd5I";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://newsapi.org/v2/top-headlines?country=br&apiKey=e638ce6ff0ba42c0b25183f87335ff61";


class Api {

  Future<List<Noticia>>pesquisar(String pesquisa) async {

    http.Response response = await http.get(
        "https://newsapi.org/v2/top-headlines?q=$pesquisa&country=br&apiKey=e638ce6ff0ba42c0b25183f87335ff61"
    );

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Noticia> noticias = dadosJson["articles"].map<Noticia>(
              (map){
            return Noticia.fromJson(map);
            //return Video.converterJson(map)
          }
      ).toList();

      return noticias;

      /*for(var video in dadosJson["items"]) {
        print("Resultad: " + video.toString()); // for = uma das maneiras de pecorrer o objeto Json
      }*/
      //print("resultado: " + dadosJson["items"][1]["snippet"]["title"].toString());
    } else {

    }
  }
}