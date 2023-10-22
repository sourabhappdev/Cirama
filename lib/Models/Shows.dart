import 'package:flutter/material.dart';

class Showmodel{
  String name;
  String overview;
  String poster_path;
  var popularity;
  String first_air_date;
  var vote_average;
  var showid;

  Showmodel(
      {
        required this.name,
        required this.showid,
        required this.overview,
        required this.poster_path,
        required this.popularity,
        required this.first_air_date,
        required this.vote_average});


  factory Showmodel.fromJson(Map<String,dynamic> jsondata){

    return Showmodel(
      name: jsondata['name'],
      overview: jsondata["overview"],
      poster_path: jsondata['poster_path'],
      popularity: jsondata['popularity'] ,
      first_air_date: jsondata["first_air_date"],
      vote_average: jsondata["vote_average"],
      showid: jsondata["id"],

    );

  }



}

