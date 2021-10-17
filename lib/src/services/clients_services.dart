import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qwilt/src/models/models.dart';

import '../../constants.dart';

class ContactsService extends ChangeNotifier {
  List<Contact> onCompleteContacts = [];

  ContactsService() {
    getAll();
  }

  getAll() async {
    final url = Uri.https(Constants.baseUrl, '/leases/all');

    final response = await http.get(url);
    final contactResponse = Contacts.fromJson(response.body);

    onCompleteContacts = contactResponse.contacts!;

    notifyListeners();
  }
}
