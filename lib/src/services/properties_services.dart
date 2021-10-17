import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qwilt/src/models/models.dart';

import '../../constants.dart';

class PropertiesService extends ChangeNotifier {
  List<Property> onCompleteProperties = [];

  PropertyService() {
    getAll();
  }

  getAll() async {
    final url = Uri.https(Constants.baseUrl, '/properties/all');

    final response = await http.get(url);
    final propertiessResponse = Properties.fromJson(response.body);

    onCompleteProperties = propertiessResponse.properties!;

    notifyListeners();
  }
}
