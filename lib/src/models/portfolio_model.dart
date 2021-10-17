import 'dart:convert';

class Portfolio {
  Portfolio({
    required this.id,
    required this.docs,
    required this.nickname,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  List<String> docs;
  String nickname;
  String owner;
  DateTime createdAt;
  DateTime updatedAt;

  factory Portfolio.fromJson(String str) => Portfolio.fromMap(json.decode(str));

  factory Portfolio.fromMap(Map<String, dynamic> json) => Portfolio(
        id: json["_id"],
        docs: List<String>.from(json["docs"].map((x) => x)),
        nickname: json["nickname"],
        owner: json["owner"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
