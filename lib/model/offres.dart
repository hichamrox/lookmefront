import 'dart:convert';

class Offre {
    Offre({
        required this.id,
        required this.userId,
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
    List<String> userId;
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
        userId: List<String>.from(json["userId"].map((x) => x)),
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
        "userId": List<dynamic>.from(userId.map((x) => x)),
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