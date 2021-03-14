class Produto {
  int id;
  String descricao;
  String imgUrl;
  double idArtesao;
  double preco;

  Produto({this.id, this.descricao, this.imgUrl, this.preco, this.idArtesao});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] as int,
      descricao: json['descricao'] as String,
      imgUrl: json['img'] as String,
      idArtesao: json['idArtesao'] as double,
      preco: json['preco'] as double,
    );
  }
}
