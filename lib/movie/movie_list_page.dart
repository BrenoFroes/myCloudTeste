import 'package:flutter/material.dart';
import 'package:my_cloud_teste/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_cloud_teste/widgets/vertical_card.dart';

class MovieListPage extends StatefulWidget {
  String call = '';
  MovieListPage({Key? key, required this.call}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> _nowPlayingMovies = <Movie>[];
  List<Movie> _popularMovies = <Movie>[];

  var url = 'https://api.themoviedb.org/3/movie/';
  var parameters = '?api_key=f02f27dcc375a0f273bfc120a646e037&language=pt-BR';

  Future<List<Movie>> popularMovie() async {
    var response = await http.get(
      url + 'popular' + parameters,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );
    var listMovies = <Movie>[];
    if (response.statusCode == 200) {
      var movieDecode = utf8.decode(response.bodyBytes);
      var moviesJson = jsonDecode(movieDecode);
      moviesJson = moviesJson['results'];
      for (var movieDecode in moviesJson) {
        var movie = Movie.fromJson(movieDecode);
        listMovies.add(movie);
      }
    }
    return listMovies;
  }

  Future<List<Movie>> nowPlayingMovie() async {
    var response = await http.get(
      url + 'now_playing' + parameters,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );
    var listMovies = <Movie>[];
    if (response.statusCode == 200) {
      var movieDecode = utf8.decode(response.bodyBytes);
      var moviesJson = jsonDecode(movieDecode);
      moviesJson = moviesJson['results'];
      for (var movieDecode in moviesJson) {
        var movie = Movie.fromJson(movieDecode);
        listMovies.add(movie);
      }
    }
    return listMovies;
  }

  @override
  void initState() {
    popularMovie().then((value) {
      setState(() {
        _popularMovies.addAll(value);
      });
    });
    nowPlayingMovie().then((value) {
      setState(() {
        _nowPlayingMovies.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.call) {
      case 'nowPlaying':
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VerticalCard(_nowPlayingMovies[index].title,
                _nowPlayingMovies[index].poster_path);
          },
          itemCount: _nowPlayingMovies.length,
        );
        break;
      case 'popular':
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VerticalCard(
                _popularMovies[index].title, _popularMovies[index].poster_path);
          },
          itemCount: _popularMovies.length,
        );
        break;
      default:
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VerticalCard(
                _popularMovies[index].title, _popularMovies[index].poster_path);
          },
          itemCount: _popularMovies.length,
        );
        break;
    }
  }
}
