import 'dart:convert';

List<Message> messageFromJson(String str) =>
    List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageToJson(List<Message> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
  Message({
    required this.id,
    required this.msg,
    required this.receiverId,
    required this.senderId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String msg;
  String receiverId;
  String senderId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        msg: json["msg"],
        receiverId: json["receiverId"],
        senderId: json["senderId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "msg": msg,
        "receiverId": receiverId,
        "senderId": senderId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
