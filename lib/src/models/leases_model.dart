// To parse this JSON data, do
//
//     final leases = leasesFromMap(jsonString);
import 'dart:convert';

import 'package:qwilt/src/models/models.dart';

class Leases {
  Leases({
    this.leases,
  });

  List<Lease>? leases;

  factory Leases.fromJson(String str) => Leases.fromMap(json.decode(str));

  factory Leases.fromMap(Map<String, dynamic> json) => Leases(
        leases: List<Lease>.from(json["Leases"].map((x) => Lease.fromMap(x))),
      );
}
