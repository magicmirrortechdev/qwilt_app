// To parse this JSON data, do
//
//     final portfolio = portfolioFromMap(jsonString);
import 'dart:convert';

import 'package:qwilt/src/models/models.dart';

class Portfolios {
  Portfolios({
    this.portfolios,
  });

  List<Portfolio>? portfolios;

  factory Portfolios.fromJson(String str) =>
      Portfolios.fromMap(json.decode(str));

  factory Portfolios.fromMap(Map<String, dynamic> json) => Portfolios(
        portfolios: List<Portfolio>.from(
            json["Portfolios"].map((x) => Portfolio.fromMap(x))),
      );
}
