import 'dart:async';
import 'package:cinemava/Screens/Controlpage.dart';
import 'package:flutter/material.dart';
import 'Concentric_scrren.dart';
import 'package:cinemava/services/constants.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
      () {
        intro
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Controlpage(),
                ))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ConcentricTransition(),
                ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image(
        image: AssetImage('assets/cirama.gif'),
      )),
    );
  }
}
