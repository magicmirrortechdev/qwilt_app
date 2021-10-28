import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _fondoApp();
  }

  Widget _fondoApp() {
    return Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_app.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        //I blured the parent container to blur background image, you can get rid of this part
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            //you can change opacity with color here(I used black) for background.
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
          ),
        ),
      )
    ]);
  }
}
