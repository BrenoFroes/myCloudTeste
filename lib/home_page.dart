// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_cloud_teste/movie/movie_block.dart';
import 'package:my_cloud_teste/style.dart';
import 'package:my_cloud_teste/views/detail_movie.dart';
import 'package:my_cloud_teste/widgets/horizontal_card.dart';
import 'package:my_cloud_teste/widgets/vertical_card.dart';

import 'movie/movie_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new MovieBlock();

  var is_visible = 0;
  var _response;
  // is_visible == 0 (default), is_visible == 1 (no results), is_visible == 2 (found results)
  var popularMovieListPage = new MovieListPage(call: 'popular');

  var nowPlayingMovieListPage = new MovieListPage(call: 'nowPlaying');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextFormField(
          keyboardType: TextInputType.text,
          controller: bloc.idCtrl,
          decoration: InputDecoration(
            labelText: "Pesquisar filmes:",
            labelStyle: AppBarStyle,
          ),
          style: AppBarStyle,
        ),
        backgroundColor: PrimaryRed1,
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                setState(() {
                  is_visible = 3;
                });
                var id = bloc.idCtrl.text;
                var response;
                await bloc.getMovieById(id).then(
                      (value) => {
                        response = value,
                        setState(
                          () {
                            response == null ? is_visible = 1 : is_visible = 2;
                          },
                        ),
                      },
                    );
                if (response == null) {
                  if (id != "") {
                    final message = SnackBar(
                      backgroundColor: Colors.white,
                      content: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Não foi possivel encontrar o filme. Tente novamente",
                          style: TextStyle(
                              color: PrimaryRed2,
                              fontWeight: FontWeight.w600,
                              fontFamily: FontNameDefaultBody),
                        ),
                      ),
                    );
                    Scaffold.of(context).showSnackBar(message);
                    setState(
                      () {
                        is_visible = 1;
                      },
                    );
                  } else {
                    setState(() {
                      is_visible = 4;
                    });
                  }
                } else {
                  final message = SnackBar(
                    backgroundColor: Colors.white,
                    content: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Filme encontrado",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontNameDefaultBody),
                      ),
                    ),
                  );
                  Scaffold.of(context).showSnackBar(message);
                  setState(() {
                    is_visible = 2;
                    _response = response;
                  });
                }
              },
            ),
          ),
        ],
      ),
      body: bodyContent(is_visible, _response),
    );
  }
}

class ContentWithResults extends StatelessWidget {
  var response;

  ContentWithResults(this.response);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          child: Text(
            "Resultados:",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: PrimaryRed3,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: FontNameDefaultBody,
            ),
          ),
          padding: const EdgeInsets.all(16),
        ),
        GestureDetector(
          child: HorizontalCard(response.title, response.poster_path),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMovie(movie: response),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ContentWithoutResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.not_interested,
                    size: 24,
                    color: Gray5,
                  ),
                ),
                TextSpan(
                  text: " Sem resultados",
                  style: TextStyle(
                      color: Gray5,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontNameDefaultBody,
                      fontSize: 22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContentLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150.0,
        width: 150.0,
        child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Gray5),
            strokeWidth: 10.0),
      ),
    );
  }
}

class PresetContent extends StatelessWidget {
  var popularMovieListPage = new MovieListPage(call: 'popular');

  var nowPlayingMovieListPage = new MovieListPage(call: 'nowPlaying');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            child: Text(
              "Últimos lançamentos",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Gray4,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: FontNameDefaultBody,
              ),
            ),
            padding: const EdgeInsets.all(16),
          ),
          Expanded(child: nowPlayingMovieListPage),
          Padding(
            child: Text(
              "Mais populares",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Gray4,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: FontNameDefaultBody,
              ),
            ),
            padding: const EdgeInsets.all(16),
          ),
          Expanded(child: popularMovieListPage),
        ],
      ),
    );
  }
}

bodyContent(is_visible, _response) {
  switch (is_visible) {
    case 1:
      return ContentWithoutResults();
      break;
    case 2:
      return ContentWithResults(_response);
      break;
    case 3:
      return ContentLoading();
      break;
    default:
      return PresetContent();
      break;
  }
}
