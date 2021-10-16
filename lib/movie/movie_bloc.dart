import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MovieBloc {
  var url = 'https://api.themoviedb.org/3/movie/';
  var parameters = '?api_key=f02f27dcc375a0f273bfc120a646e037&language=pt-BR';
  TextEditingController idCtrl = new TextEditingController();
  TextEditingController titleCtrl = new TextEditingController();
  late String originalTitleCtrl;
  late String backdropCtrl;
  late String descriptionCtrl;

  Future<Map?> getMovieById(String id) async {
    var prefs = await SharedPreferences.getInstance();
    var res = await http.get(
      url + id + parameters,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return null;
    }
  }
}
