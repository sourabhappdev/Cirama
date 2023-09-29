import 'package:flutter/material.dart';

class Castmodel{
  var name;
  var profile_path;


  Castmodel(

      {
        required this.name,
        required this.profile_path,});



  factory Castmodel.fromJson(Map<String,dynamic> jsondata){

    return Castmodel(
      name: jsondata['name'],
      profile_path: jsondata["profile_path"],
    );

  }



}

