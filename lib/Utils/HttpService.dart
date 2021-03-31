import 'dart:convert';

import 'package:arte_colaborativa/model/Produto.dart';
import 'package:http/http.dart';

class HttpService {
  Future<List<Produto>> getProduto() async {
    const String URL = "https://artecolaborativaapi.herokuapp.com/api/produto";
    //const String URL = "http://localhost:8080/api/produto"; //Funciona no Web

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
      String genero, String nome, double preco, double quantidade) async {
    const String URL = "https://api-produtos-taoalu.herokuapp.com/api/produto";

    final response = await post(URL,
        body: jsonEncode({
          "genero": genero,
          "nome": nome,
          "preco": preco,
          "quantidade": quantidade
        }),
        headers: {'Content-type': 'application/json'});

    if (response.statusCode == 200) {
      print("Sucesso:" + response.body.toString());
    } else {
      print("Erro no post: Status Code -> " + response.statusCode.toString());
    }
  }

  Future<bool> auth(String userName) async {
    bool exists = false;
    String URL =
        "https://api-produtos-taoalu.herokuapp.com/api/usuario/${userName}";
    //const String URL = "https://api-produtos-taoalu.herokuapp.com/api/produto";

    Response res = await get(URL);

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      if (body["userName"] == "taoalu") {
        exists = !exists;
      }
      return exists;
    } else {
      throw "Can't get data.";
    }
  }
}
