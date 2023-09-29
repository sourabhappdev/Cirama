import 'package:cinemava/Screens/Controlpage.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class ConcentricTransition extends StatefulWidget {
  const ConcentricTransition({super.key});

  @override
  State<ConcentricTransition> createState() => _ConcentricTransitionState();
}

class _ConcentricTransitionState extends State<ConcentricTransition> {

  List<String> lines = [
    'Cinemava offers a comprehensive database of movies and TV shows',
    'Cinemava provides user and critic ratings for movies and TV shows',
    'You can find release dates for upcoming movies and TV shows, as well as information about past releases'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        onFinish: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Controlpage(),), (route) => false);
        },

        itemCount: 3,
        radius: 30,
        verticalPosition: 0.85,
      colors: <Color>[Colors.white, Colors.blueAccent, Colors.amberAccent], // null = infinity
      itemBuilder: (int index) {
        return Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Flexible(
                    flex: 20,
                    child: Image.asset('assets/image$index.png',
                      height:400,
                      width: 400,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    lines[index],
                    style: GoogleFonts.aBeeZee(
                      letterSpacing: 1.5,
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),

                    ),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      )
    );
  }
}
