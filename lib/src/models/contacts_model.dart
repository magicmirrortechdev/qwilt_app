// To parse this JSON data, do
//
//     final properties = propertiesFromMap(jsonString);

import 'dart:convert';

import 'package:qwilt/src/models/models.dart';

class Contacts {
  Contacts({
    this.contacts,
  });

  List<Contact>? contacts;

  factory Contacts.fromJson(String str) => Contacts.fromMap(json.decode(str));

  factory Contacts.fromMap(Map<String, dynamic> json) => Contacts(
        contacts:
            List<Contact>.from(json["Contacts"].map((x) => Contact.fromMap(x))),
      );
}
