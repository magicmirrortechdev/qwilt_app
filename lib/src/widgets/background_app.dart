import 'package:flutter/material.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _fondoApp();
  }

  Widget _fondoApp() {
    return Container(
        decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/background_app.jpg'),
        fit: BoxFit.fill,
      ),
    ));
  }
}
