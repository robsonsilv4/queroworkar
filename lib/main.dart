import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QueroWorkar',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Nunito',
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
