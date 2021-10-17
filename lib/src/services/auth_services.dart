import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class AuthService extends ChangeNotifier {
  Future<Map<String, dynamic>> loginIn(Map<String, dynamic> authData) async {
    final url = Uri.https(Constants.baseUrl, '/auth/login');

    final response = await http.post(url, body: authData);

    if (response.statusCode == 401) {
      Map<String, dynamic> error = {'err': 'No found'};
      return error;
    }
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> authData) async {
    final url = Uri.https(Constants.baseUrl, '/auth/signup');

    final response = await http.post(url, body: authData);
    return json.decode(response.body);
  }
}
