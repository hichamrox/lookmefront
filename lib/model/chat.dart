import 'dart:convert';

List<Chat> chatFromJson(String str) =>
    List<Chat>.from(json.decode(str).map((x) => Chat.fromJson(x)));

String chatToJson(List<Chat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chat {
  Chat({
    required this.id,
    required this.sellerId,
    required this.costumerId,
    required this.orderId,
    required this.image,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String sellerId;
  String costumerId;
  String orderId;
  String image;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        sellerId: json["sellerId"],
        costumerId: json["costumerId"],
        orderId: json["orderId"],
        image: json["image"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sellerId": sellerId,
        "costumerId": costumerId,
        "orderId": orderId,
        "image": image,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
