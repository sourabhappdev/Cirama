import 'package:flutter/material.dart';

class Moviemodel{
  var title;
  var overview;
  var poster_path;
  var popularity;
  var release_date;
  var vote_average;
  int movieid;

  Moviemodel(

      {
      required this.title,
      required this.movieid,
      required this.overview,
      required this.poster_path,
      required this.popularity,
      required this.release_date,
      required this.vote_average});



  factory Moviemodel.fromJson(Map<String,dynamic> jsondata){

    return Moviemodel(
        title: jsondata['title'],
        overview: jsondata["overview"],
        poster_path: jsondata['poster_path'],
        popularity: jsondata['popularity'] ,
        release_date: jsondata["release_date"],
        vote_average: jsondata["vote_average"],
        movieid: jsondata["id"],
    );

  }



}

