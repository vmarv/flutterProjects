class Noticia{
  String fonte;
  String titulo;
  String descricao;
  String imagem;
  String url;
  String conteudo;

  Noticia({this.fonte, this.titulo, this.descricao, this.imagem, this.url, this.conteudo});



  factory Noticia.fromJson(Map<String, dynamic> json){ // factory = instancia 1 unica vez so, e retorna um unico obj
    return Noticia(
        fonte: json["source"]["name"],
        titulo: json["title"],
        descricao: json["description"],
        imagem: json["urlToImage"],
        url: json["url"],
        conteudo: json["content"],
    );
  }


}