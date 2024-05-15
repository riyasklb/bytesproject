// To parse this JSON data, do
//
//     final getPordectsModel = getPordectsModelFromJson(jsonString);

import 'dart:convert';

GetPordectsModel getPordectsModelFromJson(String str) =>
    GetPordectsModel.fromJson(json.decode(str));

String getPordectsModelToJson(GetPordectsModel data) =>
    json.encode(data.toJson());

class GetPordectsModel {
  bool success;
  List<Productsdetails> list;
  String msg;

  GetPordectsModel({
    required this.success,
    required this.list,
    required this.msg,
  });

  factory GetPordectsModel.fromJson(Map<String, dynamic> json) =>
      GetPordectsModel(
        success: json["success"],
        list: List<Productsdetails>.from(
            json["list"].map((x) => Productsdetails.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "msg": msg,
      };
}

class Productsdetails {
  String title;
  int price;
  String image;
  String type;

  Productsdetails({
    required this.title,
    required this.price,
    required this.image,
    required this.type,
  });

  factory Productsdetails.fromJson(Map<String, dynamic> json) =>
      Productsdetails(
        title: json["title"],
        price: json["price"],
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "image": image,
        "type": type,
      };
}
