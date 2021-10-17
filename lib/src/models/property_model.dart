import 'dart:convert';

class Property {
  Property({
    required this.id,
    required this.status,
    required this.photos,
    required this.name,
    required this.location,
    required this.description,
    required this.targetRent,
    required this.portfolioId,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String status;
  List<String> photos;
  String name;
  String location;
  String description;
  int targetRent;
  String portfolioId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Property.fromJson(String str) => Property.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Property.fromMap(Map<String, dynamic> json) => Property(
        id: json["_id"],
        status: json["status"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        name: json["name"],
        location: json["location"],
        description: json["description"],
        targetRent: json["targetRent"],
        portfolioId: json["portfolioId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "status": status,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "name": name,
        "location": location,
        "description": description,
        "targetRent": targetRent,
        "portfolioId": portfolioId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
