import 'package:cinemava/Components/getGenre.dart';
import 'package:cinemava/Components/showTiles.dart';
import 'package:cinemava/services/backend.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cinemava/Models/Movie.dart';
import '../Components/TrendingSlider.dart';
import '../Components/movietiles.dart';
import '../Models/Shows.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

late Future<List<Moviemodel>> trendingMovies;
late Future<List<Moviemodel>> topratedMovies;
late Future<List<Moviemodel>> upcomingMovies;
late Future<List<Showmodel>> trendingShows;
late Future<List<Showmodel>> topratedShows;
late Future<List<Showmodel>> airingTodayShows;


class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingmovies();
    topratedMovies = Api().getTopratedmovies();
    upcomingMovies = Api().getUpcomingmovies();
    trendingShows = Api().getTrendingshows();
    topratedShows = Api().getTopratedshows();
    airingTodayShows = Api().getAiringtodayshows();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: topratedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieTiles(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Upcoming Movies',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieTiles(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                'Drama',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Genrewidget(genreId: 18),

              const SizedBox(
                height: 20,
              ), Text(
                'Animation',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Genrewidget(genreId: 16),

              const SizedBox(
                height: 20,
              ), Text(
                'Science Fiction',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Genrewidget(genreId: 878),

              const SizedBox(
                height: 20,
              ), Text(
                'Mystery',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Genrewidget(genreId: 9648),

              const SizedBox(
                height: 20,
              ), Text(
                'Adventure',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Genrewidget(genreId: 12),

              const SizedBox(
                height: 20,
              ), Text(
                'Horror',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Genrewidget(genreId: 27),

              const SizedBox(
                height: 20,
              ),



















              //Shows


              Text(
                'Trending Shows',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return Showtiles(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Top Rated Shows',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: topratedShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return Showtiles(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Airing Today Shows',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: airingTodayShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return Showtiles(
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
      ),
    );
  }
}
