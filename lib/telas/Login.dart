import 'package:arte_colaborativa/Utils/HttpService.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

TextEditingController _userController = TextEditingController();
TextEditingController _senhaController = TextEditingController();

class _TelaLoginState extends State<TelaLogin> {
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/ui/logo.png'),
              ),
              Container(
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  controller: _userController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0),
                    ),
                    labelText: 'Usuário',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                  maxLines: 1,
                  maxLength: 12,
                  textAlign: TextAlign.center,
                  controller: _senhaController,
                  decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0),
                    ),
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: 300,
                height: 55,
                child: ElevatedButton(
                  child: Text("Logar"),
                  onPressed: () {
                    //Future<bool> u = httpService.auth(_userController.text);
                    _userController.text == "A"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(
                                perfil: "A",
                              ),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(
                                perfil: "L",
                              ),
                            ),
                          );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                width: 300,
                height: 55,
                child: ElevatedButton(
                  child: Text("Cadastre-se"),
                  onPressed: () {
                    // _userController.text == "L"
                    //     ? Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Home(
                    //             perfil: "L",
                    //           ),
                    //         ),
                    //       )
                    //     : Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Home(
                    //             perfil: "A",
                    //           ),
                    //         ),
                    //       );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
