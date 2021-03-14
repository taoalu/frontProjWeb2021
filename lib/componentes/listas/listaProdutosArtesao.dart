import 'package:arte_colaborativa/Utils/HttpService.dart';
import 'package:arte_colaborativa/model/Produto.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListaProdutosArtesao extends StatefulWidget {
  final ValueChanged<Produto> parentAction;
  final int idArtesao;
  final String perfil;

  const ListaProdutosArtesao(
      {Key key, this.parentAction, this.idArtesao, this.perfil})
      : super(key: key);

  @override
  _ListaProdutosArtesaoState createState() => _ListaProdutosArtesaoState();
}

@override
void initState() {}

class _ListaProdutosArtesaoState extends State<ListaProdutosArtesao> {
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getProduto(),
      builder: (BuildContext context, AsyncSnapshot<List<Produto>> snapshot) {
        if (snapshot.hasData) {
          final List<Produto> produtos = snapshot.data;
          return Container(
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/ui/logo.png'),
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      "Descrição:" + produtos[index].descricao,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return Container(
            width: 100,
            height: 100,
            child: Lottie.asset('assets/images/lottie/engrenagem.json'),
          );
        }
      },
    );
  }
}
