// To parse this JSON data, do
//
//     final adress = adressFromJson(jsonString);

import 'dart:convert';

List<Adress> adressFromJson(String str) =>
    List<Adress>.from(json.decode(str).map((x) => Adress.fromJson(x)));

String adressToJson(List<Adress> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Adress {
  Adress({
    required this.id,
    required this.adress,
    required this.city,
    required this.cp,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String adress;
  String city;
  int cp;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Adress.fromJson(Map<String, dynamic> json) => Adress(
        id: json["_id"],
        adress: json["adress"],
        city: json["city"],
        cp: json["cp"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "adress": adress,
        "city": city,
        "cp": cp,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
