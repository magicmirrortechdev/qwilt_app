import 'dart:convert';

class Lease {
  Lease({
    required this.id,
    required this.docs,
    required this.name,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.rentalRate,
    required this.contactId,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  List<dynamic> docs;
  String name;
  String status;
  DateTime startDate;
  DateTime endDate;
  int rentalRate;
  String contactId;
  String propertyId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Lease.fromJson(String str) => Lease.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lease.fromMap(Map<String, dynamic> json) => Lease(
        id: json["_id"],
        docs: List<dynamic>.from(json["docs"].map((x) => x)),
        name: json["name"],
        status: json["status"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        rentalRate: json["rentalRate"],
        contactId: json["contactId"],
        propertyId: json["propertyId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "docs": List<dynamic>.from(docs.map((x) => x)),
        "name": name,
        "status": status,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "rentalRate": rentalRate,
        "contactId": contactId,
        "propertyId": propertyId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
