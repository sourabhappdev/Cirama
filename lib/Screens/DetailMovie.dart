import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemava/Models/Movie.dart';
import 'package:cinemava/services/backend.dart';
import 'package:flutter/material.dart';
import 'package:cinemava/services/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/casttiles.dart';

class Deatilmovie extends StatefulWidget {
  const Deatilmovie({super.key, required this.moviemodel});

  final Moviemodel moviemodel;

  @override
  State<Deatilmovie> createState() => _DeatilmovieState(data: moviemodel);
}

class _DeatilmovieState extends State<Deatilmovie> {
  _DeatilmovieState({required this.data});

  Moviemodel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              color: Colors.black12,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "$Imagepath${data.poster_path}",
                    imageBuilder: (context, imageProvider) => Container(
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
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
              color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    '⭐ ${(data.vote_average).toStringAsFixed(1)}',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
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
                    'Release date  ${data.release_date}',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.normal,
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
                        fontWeight: FontWeight.normal,
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
                    'Overview',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        textBaseline: TextBaseline.ideographic,
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2,
                        fontSize: 20,
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
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'CAST',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.red,
                    height: 250,
                    child: FutureBuilder(

                      future: Api().getCast(data.movieid),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return CastTiles(
                            snapshot: snapshot,
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ), const SizedBox(
              height: 20,
            ), const SizedBox(
              height: 20,
            ), const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
