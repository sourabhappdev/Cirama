import 'package:cinemava/Screens/Concentric_scrren.dart';
import 'package:cinemava/Screens/Controlpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


 bool intro = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    getvalue();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true
      ),
      home: intro ? const Controlpage() :const ConcentricTransition(),

    );
  }

  void getvalue() async{

    var prefs = await SharedPreferences.getInstance();
    var temp=prefs.getBool("intro")!;
    intro= temp!;
    print(intro);
  }
}