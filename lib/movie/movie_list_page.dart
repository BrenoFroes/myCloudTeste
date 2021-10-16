import 'package:flutter/material.dart';
import 'package:my_cloud_teste/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_cloud_teste/widgets/vertical_card.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> _movies = <Movie>[];

  Future<List<Movie>> fetchMovie() async {
    var url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=f02f27dcc375a0f273bfc120a646e037&language=pt-BR';
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );
    print(url);
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
    fetchMovie().then((value) {
      setState(() {
        _movies.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return VerticalCard(
            '${_movies[index].title}', '${_movies[index].original_title}');
      },
      itemCount: _movies.length,
    );
  }
}
