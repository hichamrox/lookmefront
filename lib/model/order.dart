import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.state,
    required this.id,
    required this.userId,
    required this.offerId,
    required this.cost,
    required this.days,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  State state;
  String id;
  String userId;
  String offerId;
  int cost;
  int days;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        state: State.fromJson(json["state"]),
        id: json["_id"],
        userId: json["userId"],
        offerId: json["offerId"],
        cost: json["cost"],
        days: json["days"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "state": state.toJson(),
        "_id": id,
        "userId": userId,
        "offerId": offerId,
        "cost": cost,
        "days": days,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class State {
  State({
    required this.validation,
    required this.send,
    required this.shiping,
    required this.delivered,
  });

  bool validation;
  bool send;
  bool shiping;
  bool delivered;

  factory State.fromJson(Map<String, dynamic> json) => State(
        validation: json["validation"],
        send: json["send"],
        shiping: json["shiping"],
        delivered: json["delivered"],
      );

  Map<String, dynamic> toJson() => {
        "validation": validation,
        "send": send,
        "shiping": shiping,
        "delivered": delivered,
      };
}
