class Usuario {
  String userName;
  String password;

  Usuario({
    this.userName,
    this.password,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      userName: json["userName"],
      password: json["password"],
    );
  }
}
