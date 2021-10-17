// To parse this JSON data, do
//
//     final properties = propertiesFromMap(jsonString);
import 'dart:convert';

import 'package:qwilt/src/models/property_model.dart';

class Properties {
  Properties({
    this.properties,
  });

  List<Property>? properties;

  factory Properties.fromJson(String str) =>
      Properties.fromMap(json.decode(str));

  factory Properties.fromMap(Map<String, dynamic> json) => Properties(
        properties: List<Property>.from(
            json["Properties"].map((x) => Property.fromMap(x))),
      );
}
