import 'package:arte_colaborativa/Utils/HttpService.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardProduto extends StatefulWidget {
  final String descricao;
  final double preco;
  final String imgUrl;
  final int objID;

  const CardProduto(
      {Key key, this.descricao, this.preco, this.imgUrl, this.objID})
      : super(key: key);

  @override
  _CardProdutoState createState() => _CardProdutoState();
}

class _CardProdutoState extends State<CardProduto> {
  HttpService httpService = HttpService();

  TextEditingController _descricaoController = new TextEditingController();
  TextEditingController _precoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: InkWell(
        splashColor: Colors.amberAccent,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Detalhes do produto"),
                content: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      right: -40.0,
                      top: -40.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Desc.: " + widget.descricao),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Preço: " + widget.preco.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: widget.imgUrl.isNotEmpty
                        ? Image.network(
                            widget.imgUrl,
                            width: 50,
                            height: 50,
                          )
                        : Lottie.asset('assets/images/lottie/engrenagem.json'),
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          widget.descricao,
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () => {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Editar Produto"),
                              content: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  Positioned(
                                    right: -40.0,
                                    top: -40.0,
                                    child: InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: CircleAvatar(
                                        child: Icon(Icons.close),
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Form(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _descricaoController,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _precoController,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            child: Text("Salvar"),
                                            onPressed: () {
                                              httpService.atualizarProduto(
                                                _descricaoController.text,
                                                widget.objID,
                                                1,
                                                double.parse(
                                                    _precoController.text),
                                              );
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      },
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () async =>
                          await httpService.deletarProduto(widget.objID),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
