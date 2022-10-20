// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
    ImageModel({
        this.image,
    });

    List<Image>? image;

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        image: List<Image>.from(json["Image"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Image": List<dynamic>.from(image!.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        this.id,
        this.image,
        this.name,
    });

    String? id;
    String? image;
    String? name;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
    };
}
