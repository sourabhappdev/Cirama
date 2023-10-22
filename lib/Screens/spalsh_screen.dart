// import 'dart:async';
//
// import 'package:cinemava/Screens/Concentric_scrren.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gif/flutter_gif.dart';
//
// class Splash extends StatefulWidget {
//   late FlutterGifController controller;
//
//   @override
//   State<Splash> createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> with TickerProviderStateMixin {
//   late FlutterGifController controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = FlutterGifController(vsync: this);
//     controller.
//     Timer(
//       Duration(seconds: 4),
//       () {
//         // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ConcentricTransition(),));
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//
//           // Image(image: AssetImage('assets/cirama.gif'),),
//
//           GifImage(
//               image: AssetImage('assets/cirama.gif'), controller: controller),
//         ],
//       ),
//     );
//   }
// }
