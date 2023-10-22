import 'package:flutter/material.dart';

class Genresmodel{
  var name;
  var id;


  Genresmodel(

      {
        required this.name,
        required this.id,});



  factory Genresmodel.fromJson(Map<String,dynamic> jsondata){

    return Genresmodel(
      name: jsondata["name"],
      id: jsondata["id"],
    );

  }



}

