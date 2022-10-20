import 'dart:convert';



registerModel welcomeFromJson(String str) => registerModel.fromJson(json.decode(str));

String registerModelToJson(registerModel data) => json.encode(data.toJson());

class registerModel {
    registerModel({
      required this.ID,
      required this.PIN,
     
    });

    String ID;
    String PIN;
   

    factory registerModel.fromJson(Map<String, dynamic> json) => registerModel(
        ID: json["ID"],
        PIN: json["PIN"],
       
    );

    Map<String, dynamic> toJson() => {
        "ID": ID,
        "PIN": PIN,
      
    };
}