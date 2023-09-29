import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemava/services/backend.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Movie.dart';
import '../services/constants.dart';
import 'package:cinemava/Screens/DetailMovie.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

late Future<List<Moviemodel>> nowPlayingMovies;

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    super.initState();
    nowPlayingMovies = Api().getNowplayingmovies();
  }

  String imageurl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/640px-A_black_image.jpg';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: CachedNetworkImage(
              imageUrl: imageurl,
              imageBuilder: (context, imageProvider) => Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    //image size fill
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
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(1),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: FutureBuilder(
              future: nowPlayingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return CarouselSlider.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Deatilmovie(
                                  moviemodel: snapshot.data![index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 30,bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    "$Imagepath${snapshot.data?[index].poster_path}",
                                    imageBuilder: (context, imageProvider) => Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          //image size fill
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
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    '${snapshot.data?[index].title}',
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                        textBaseline: TextBaseline.ideographic,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                '${snapshot.data?[index].vote_average} ⭐',
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                    textBaseline: TextBaseline.ideographic,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(milliseconds: 1500),
                      height: 500,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          imageurl = "$Imagepath${snapshot.data?[index].poster_path}";
                        });
                      },
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
