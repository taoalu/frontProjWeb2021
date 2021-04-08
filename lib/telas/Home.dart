import 'package:arte_colaborativa/Utils/HttpService.dart';
import 'package:arte_colaborativa/componentes/listas/listaProdutosArtesao.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Login.dart';

class Home extends StatefulWidget {
  final BuildContext mContext;

  const Home({Key key, this.mContext, this.perfil}) : super(key: key);

  final String perfil;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HttpService httpService = HttpService();
  final _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    TextEditingController _descricaoController = new TextEditingController();
    TextEditingController _precoController = new TextEditingController();
    TextEditingController _idArtesaoController = new TextEditingController();

    var screenSize = MediaQuery.of(context).size;
    if (widget.perfil == "A") {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Container(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Painel do Artesão',
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaLogin(),
                              ),
                            );
                          },
                          onHover: (value) {
                            setState(() {
                              _isHovering[0] = value;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Produtos',
                                style: TextStyle(
                                    color: _isHovering[0]
                                        ? Colors.orange
                                        : Colors.white),
                              ),
                              SizedBox(height: 5),
                              // Underline dos botões da barra
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: _isHovering[0],
                                child: Container(
                                  height: 2,
                                  width: 60,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                        ),
                        //Espaço entre botões da barra
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaLogin(),
                              ),
                            );
                          },
                          onHover: (value) {
                            setState(() {
                              _isHovering[1] = value;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Vendas',
                                style: TextStyle(
                                    color: _isHovering[1]
                                        ? Colors.orange
                                        : Colors.white),
                              ),
                              SizedBox(height: 5),
                              // Underline dos botões da barra
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: _isHovering[1],
                                child: Container(
                                  height: 2,
                                  width: 60,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            var parentHeight = constraints.maxHeight;
            var parentWidth = constraints.maxWidth;
            return Container(
              width: parentWidth,
              height: parentHeight,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          "Seus Produtos",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Criar Produto"),
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
                                                httpService.criarProduto(
                                                  _descricaoController.text,
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
                          );
                        },
                        child: const Icon(Icons.add),
                        backgroundColor: Colors.orange,
                      ),
                      Container(
                        width: parentWidth * .5,
                        height: parentHeight * .8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            //color: Colors.orange,
                            width: parentWidth * 0.4,
                            height: parentHeight * 0.3,
                            child: ListaProdutosArtesao(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else if (widget.perfil == "L") {
      return Scaffold(
        //backgroundColor: HexColor('#212121'),
        appBar: AppBar(
          centerTitle: true,
          //backgroundColor: HexColor('#092e56'),
          title: Text('Painel do Lojista'),
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Bem vindo!'),
                  accountEmail: Text(''),
                  // currentAccountPicture: new CircleAvatar(
                  //   backgroundImage: AssetImage(
                  //       "assets/images/items/defenses/orbs/orb144.gif"),
                  // ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  enabled: true,
                  title: Text(
                    'News',
                  ),
                  trailing: new Icon(
                    Icons.fiber_new,
                    color: HexColor('#f8ce63'),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaLogin(),
                      ),
                    );
                  },
                ),
                ListTile(
                  enabled: true,
                  title: Text(
                    'Events Calendar',
                  ),
                  trailing: new Icon(
                    Icons.event,
                    color: HexColor('#f8ce63'),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaLogin(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
