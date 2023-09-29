import 'package:cinemava/services/backend.dart';
import 'package:flutter/material.dart';

import 'movietiles.dart';

class Genrewidget extends StatefulWidget {
  const Genrewidget({super.key, required this.genreId});

  final int genreId;

  @override
  State<Genrewidget> createState() => _GenrewidgetState(genre: genreId);
}

class _GenrewidgetState extends State<Genrewidget> {

  _GenrewidgetState({required this.genre});

  final int genre;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api().getgenre(genre),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if(snapshot.hasData) {
          return MovieTiles(snapshot: snapshot,);
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
