import 'dart:convert';

class Portfolio {
  Portfolio({
    required this.id,
    required this.docs,
    required this.nickname,
    required this.owner,
    required this.capacityRatio,
    required this.counterProperties,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  List<String> docs;
  String nickname;
  String owner;
  int counterProperties;
  double capacityRatio;
  DateTime createdAt;
  DateTime updatedAt;

  factory Portfolio.fromJson(String str) => Portfolio.fromMap(json.decode(str));

  factory Portfolio.fromMap(Map<String, dynamic> json) => Portfolio(
        id: json["_id"],
        docs: List<String>.from(json["docs"].map((x) => x)),
        nickname: json["nickname"],
        owner: json["owner"],
        capacityRatio:
            json["capacityRatio"] == null ? 0 : json["capacityRatio"],
        counterProperties: json["counterProperties"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
