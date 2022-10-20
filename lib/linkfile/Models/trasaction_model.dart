// To parse this JSON data, do
//
//     final trasactionModel = trasactionModelFromJson(jsonString);

import 'dart:convert';

TrasactionModel trasactionModelFromJson(String str) =>
    TrasactionModel.fromJson(json.decode(str));

String trasactionModelToJson(TrasactionModel data) =>
    json.encode(data.toJson());

class TrasactionModel {
  TrasactionModel({
    this.success,
    this.detail,
  });

  String? success;
  List<Detail>? detail;

  factory TrasactionModel.fromJson(Map<String, dynamic> json) =>
      TrasactionModel(
        success: json["success"],
        detail:
            List<Detail>.from(json["Detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "Detail": List<dynamic>.from(detail!.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.detailId,
    this.id,
    this.detail,
    this.amount,
    this.description,
    this.createdAt,
    this.time,
    this.trasctionType,
    this.v,
    this.to,
    this.letter,
  });

  String? detailId;
  String? id;
  String? detail;
  String? amount;
  String? description;
  DateTime? createdAt;
  String? time;
  bool? trasctionType;
  int? v;
  String? to;
  String? letter;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        detailId: json["_id"],
        id: json["ID"],
        detail: json["Detail"],
        amount: json["amount"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]).toLocal(),
        time: json["time"],
        trasctionType: json["trasction_type"],
        v: json["__v"],
        to: json["To"],
        letter: json["letter"],
      );

  Map<String, dynamic> toJson() => {
        "_id": detailId,
        "ID": id,
        "Detail": detail,
        "amount": amount,
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "time": time,
        "trasction_type": trasctionType,
        "__v": v,
        "To": to,
        "letter": letter,
      };
}
