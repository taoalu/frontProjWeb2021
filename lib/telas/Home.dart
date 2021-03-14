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
                            print('passou');
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
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.orange,
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.3,
                        child: ListaProdutosArtesao(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.orange,
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.3,
                        child: ListaProdutosArtesao(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.orange,
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.3,
                        child: ListaProdutosArtesao(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
