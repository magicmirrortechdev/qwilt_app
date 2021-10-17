import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qwilt/src/models/models.dart';

import '../../constants.dart';

class PortfoliosService extends ChangeNotifier {
  List<Portfolio> onCompletePortfolios = [];

  PortfoliosService() {
    getAll();
  }

  getAll() async {
    final url = Uri.https(Constants.baseUrl, '/portfolios/all');

    final response = await http.get(url);
    final portfoliosResponse = Portfolios.fromJson(response.body);

    onCompletePortfolios = portfoliosResponse.portfolios!;

    notifyListeners();
  }
}
