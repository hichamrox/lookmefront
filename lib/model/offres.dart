import 'dart:convert';

List<Offre> offreFromJson(String str) =>
    List<Offre>.from(json.decode(str).map((x) => Offre.fromJson(x)));

String offreToJson(List<Offre> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offre {
  Offre({
    required this.id,
    required this.userId,
    required this.image,
    required this.title,
    required this.description,
    required this.cost,
    required this.size,
    required this.morphology,
    required this.height,
    required this.category,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  String image;
  String title;
  String description;
  int cost;
  String size;
  String morphology;
  String height;
  String category;
  List<dynamic> comments;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Offre.fromJson(Map<String, dynamic> json) => Offre(
        id: json["_id"],
        userId: json["userId"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        cost: json["cost"],
        size: json["size"],
        morphology: json["morphology"],
        height: json["height"],
        category: json["category"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "image": image,
        "title": title,
        "description": description,
        "cost": cost,
        "size": size,
        "morphology": morphology,
        "height": height,
        "category": category,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
