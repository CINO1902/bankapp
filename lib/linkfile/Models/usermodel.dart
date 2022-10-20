import 'dart:convert';

List<UserModel> UserModelFromJson(String str) => 
List<UserModel>.from(json.decode(str).map((x) =>UserModel.fromJson(x)));



String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.ID,
      required this.PIN,
    });

    String ID;
    String PIN;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        ID: json["ID"],
        PIN: json["PIN"],
    );

    Map<String, dynamic> toJson() => {
        "ID": ID,
        "PIN":PIN,
    };
}