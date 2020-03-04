import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInImage(
                fadeOutDuration: Duration(milliseconds: 100),
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage('assets/logo.png'),
                height: 60.0,
              ),
              SizedBox(height: 4.0),
              FadeInImage(
                fadeOutDuration: Duration(milliseconds: 300),
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage('assets/branding.png'),
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
