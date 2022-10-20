// To parse this JSON data, do
//
//     final balanceModel = balanceModelFromJson(jsonString);

import 'dart:convert';

BalanceModel balanceModelFromJson(String str) => BalanceModel.fromJson(json.decode(str));

String balanceModelToJson(BalanceModel data) => json.encode(data.toJson());

class BalanceModel {
    BalanceModel({
        this.status,
        this.balance,
    });

    String? status;
    Balance? balance;

    factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        status: json["status"],
        balance: Balance.fromJson(json["balance"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "balance": balance?.toJson(),
    };
}

class Balance {
    Balance({
        this.balanceId,
        this.id,
        this.pin,
        this.balance,
        this.v,
    });

    String? balanceId;
    String? id;
    String? pin;
    String? balance;
    int? v;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balanceId: json["_id"],
        id: json["ID"],
        pin: json["PIN"],
        balance: json["balance"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": balanceId,
        "ID": id,
        "PIN": pin,
        "balance": balance,
        "__v": v,
    };
}
