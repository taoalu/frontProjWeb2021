import 'dart:convert';

import 'package:arte_colaborativa/model/Produto.dart';
import 'package:http/http.dart' show Response, get, post, put;

class HttpService {
  Future<List<Produto>> getProduto() async {
    //const String URL = "https://artecolaborativaapi.herokuapp.com/api/produto";
    const String URL = "http://localhost:8082/api/produto";

    Response res = await get(URL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Produto> rankingItems = body
          .map(
            (dynamic item) => Produto.fromJson(item),
          )
          .toList();
      return rankingItems;
    } else {
      throw "Can't get data.";
    }
  }

  Future<Produto> criarProduto(
      String descricao, int idArtesao, double preco) async {
    //const String URL = "https://artecolaborativaapi.herokuapp.com/api/produto";
    const String URL = "http://localhost:8082/api/produto";

    final response = await post(
      URL,
      body:
          jsonEncode({"descricao": descricao, "idArtesao": 1, "preco": preco}),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      print("Sucesso:" + response.body.toString());
    } else {
      print("Erro no post: Status Code -> " + response.statusCode.toString());
    }
  }

  Future<Produto> atualizarProduto(
      String descricao, int id, int id_artesao, double preco) async {
    //const String URL = "https://artecolaborativaapi.herokuapp.com/api/produto";
    const String URL = "http://localhost:8082/api/produto";

    final response = await put(URL,
        body: jsonEncode({
          "descricao": descricao,
          "id": id,
          "preco": preco,
          "id_artesao": id_artesao
        }),
        headers: {'Content-type': 'application/json'});

    if (response.statusCode == 200) {
      print("Sucesso:" + response.body.toString());
    } else {
      print("Erro no post: Status Code -> " + response.statusCode.toString());
    }
  }

  Future<Produto> deletarProduto(int id) async {
    //String URL = "https://artecolaborativaapi.herokuapp.com/api/produto/$id";
    String URL = "http://localhost:8082/api/produto/$id";

    final response = await post(URL);

    if (response.statusCode == 200) {
      print("Sucesso:" + response.body.toString());
    } else {
      print("Erro no post: Status Code -> " + response.statusCode.toString());
    }
  }
}
