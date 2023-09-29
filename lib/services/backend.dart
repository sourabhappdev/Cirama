import 'dart:convert';

import 'package:cinemava/Models/Cast.dart';
import 'package:cinemava/Models/Shows.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'package:cinemava/Models/Movie.dart';

class Api {
  Future<List<Moviemodel>> getTrendingmovies() async {
    final response = await http.get(Uri.parse(TrendingmoviesUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Moviemodel.fromJson(movie)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Moviemodel>> getTopratedmovies() async {
    final response = await http.get(Uri.parse(Top_ratedmoviesUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Moviemodel.fromJson(movie)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Moviemodel>> getUpcomingmovies() async {
    final response = await http.get(Uri.parse(UpcomingmoviesUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Moviemodel.fromJson(movie)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Moviemodel>> getNowplayingmovies() async {
    final response = await http.get(Uri.parse(NowPlayingMovieUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Moviemodel.fromJson(movie)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Moviemodel>> getgenre(int genre) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?&sort_by=popularity.desc&with_genres=$genre&api_key=$Apikey'));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Moviemodel.fromJson(movie)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Showmodel>> getTrendingshows() async {
    final response = await http.get(Uri.parse(TrendingshowsUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((show) => Showmodel.fromJson(show)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Showmodel>> getTopratedshows() async {
    final response = await http.get(Uri.parse(Top_ratedshowsUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((show) => Showmodel.fromJson(show)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Showmodel>> getAiringtodayshows() async {
    final response = await http.get(Uri.parse(AiringtodayshowsUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((show) => Showmodel.fromJson(show)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Showmodel>> getOnTheAirshows() async {
    final response = await http.get(Uri.parse(OnTheAirShowUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((show) => Showmodel.fromJson(show)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }

  Future<List<Castmodel>> getCast(int id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=$Apikey&append_to_response=credits'));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["credits"]['cast'] as List;

      return decodedData.map((cast) => Castmodel.fromJson(cast)).toList();
    } else {
      throw Exception("Something Went wrong");
    }
  }
}
