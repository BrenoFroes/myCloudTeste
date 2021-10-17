import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_cloud_teste/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieBlock {
  var url = 'https://api.themoviedb.org/3/movie/';
  var parameters = '?api_key=f02f27dcc375a0f273bfc120a646e037&language=pt-BR';
  TextEditingController idCtrl = new TextEditingController();

  Future<Movie?> getMovieById(String id) async {
    var prefs = await SharedPreferences.getInstance();
    var response = await http.get(
      url + id + parameters,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );
    if (response.statusCode == 200) {
      var movieDecode = utf8.decode(response.bodyBytes);
      var movieJson = jsonDecode(movieDecode);
      var movie = Movie.fromJson(movieJson);
      return movie;
    } else {
      return null;
    }
  }
}
