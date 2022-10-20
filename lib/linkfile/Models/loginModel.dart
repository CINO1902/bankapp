import 'dart:convert';

LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.ID,
    required this.PIN,
  });

  String ID;
  String PIN;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        ID: json["ID"],
        PIN: json["PIN"],
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "PIN": PIN,
      };
}
