// To parse this JSON data, do
//
//     final favori = favoriFromJson(jsonString);

import 'dart:convert';

List<Favori> favoriFromJson(String str) =>
    List<Favori>.from(json.decode(str).map((x) => Favori.fromJson(x)));

String favoriToJson(List<Favori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favori {
  Favori({
    required this.id,
    required this.offerId,
    required this.userId,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String offerId;
  String userId;
  String title;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Favori.fromJson(Map<String, dynamic> json) => Favori(
        id: json["_id"],
        offerId: json["offerId"],
        userId: json["userId"],
        title: json["title"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "offerId": offerId,
        "userId": userId,
        "title": title,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
