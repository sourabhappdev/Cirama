import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemava/Models/Shows.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/constants.dart';

class Detailshow extends StatefulWidget {
  const Detailshow({super.key, required this.showmodel});

  final Showmodel showmodel;

  @override
  State<Detailshow> createState() => _DetailshowState(data: showmodel);
}

class _DetailshowState extends State<Detailshow> {


  _DetailshowState({required this.data});

  Showmodel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              color: Colors.black,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "$Imagepath${data.poster_path}",
                    imageBuilder: (context, imageProvider) => Container(
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: const SizedBox(
                          width: 200,
                          height: 300,
                          child: Center(
                              child:
                              CircularProgressIndicator())), // you can add pre loader iamge as well to show loading.
                    ), //show progress  while loading image
                    errorWidget: (context, url, error) => Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                        child: const Icon(Icons.error)),
                    //show no image available image on error loading
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width / 4,
                    bottom: 0,
                    width: 200,
                    height: 300,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CachedNetworkImage(
                          imageUrl: "$Imagepath${data.poster_path}",
                          imageBuilder: (context, imageProvider) => Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const SizedBox(
                                width: 200,
                                height: 300,
                                child: Center(
                                    child:
                                    CircularProgressIndicator())), // you can add pre loader iamge as well to show loading.
                          ), //show progress  while loading image
                          errorWidget: (context, url, error) => Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey,
                              child: const Icon(Icons.error)),
                          //show no image available image on error loading
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.name,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    '⭐ ${data.vote_average}',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    'First Air date  ${data.first_air_date}',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    'Popularity  ${(data.popularity).toStringAsFixed(0)}',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Overview :-',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      data.overview,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.bebasNeue(
                        textStyle: TextStyle(
                          textBaseline: TextBaseline.ideographic,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

