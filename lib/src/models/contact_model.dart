import 'dart:convert';

class Contact {
  Contact({
    required this.photos,
    required this.type,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
  });

  List<String> photos;
  String type;
  String id;
  String name;
  String email;
  String phone;
  String propertyId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Contact.fromJson(String str) => Contact.fromMap(json.decode(str));

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        photos: List<String>.from(json["photos"].map((x) => x)),
        type: json["type"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        propertyId: json["propertyId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "photos": List<String>.from(photos.map((x) => x)),
        "type": type,
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "propertyId": propertyId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
