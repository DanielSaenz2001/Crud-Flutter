
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';


class ModeloUsuario {
  ModeloUsuario({
    this.access_token,
    this.token_type,
    this.email,
    this.password,
    this.expires_in,
    this.user,
  });

  String access_token;
  String token_type;
  String email;
  String password;
  int expires_in;
  int user;

  factory ModeloUsuario.fromJson(Map<String, dynamic> json) => ModeloUsuario(
    token_type: json["token_type"],
    expires_in: json["expires_in"],
    user: json["user"],
    access_token: json["access_token"],
    email: json["email"],
    password: json["password"],
  );

  //"authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['access_token']=this.access_token;
    data['token_type']=this.token_type;
    data['email']=this.email;
    data['expires_in']=this.expires_in;
    data['user']=this.user;
    data['password']=this.password;
    return data;
  }
}
