import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qwilt/src/models/models.dart';

import '../../constants.dart';

class LeasesService extends ChangeNotifier {
  List<Lease> onCompleteLeases = [];

  LeaseService() {
    getAll();
  }

  getAll() async {
    final url = Uri.https(Constants.baseUrl, '/leases/all');

    final response = await http.get(url);
    final leasesResponse = Leases.fromJson(response.body);

    onCompleteLeases = leasesResponse.leases!;

    notifyListeners();
  }
}
