// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_cloud_teste/style.dart';
import 'package:my_cloud_teste/widgets/horizontal_card.dart';
import 'package:my_cloud_teste/widgets/vertical_card.dart';

import 'movie/movie_list_page.dart';

class HomePage extends StatelessWidget {
  TextEditingController movieCtrl = new TextEditingController();
  var popularMovieListPage = new MovieListPage(call: 'popular');
  var nowPlayingMovieListPage = new MovieListPage(call: 'nowPlaying');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextFormField(
            keyboardType: TextInputType.text,
            controller: movieCtrl,
            decoration: InputDecoration(
              labelText: "Pesquisar filmes:",
              labelStyle: AppBarStyle,
            ),
            style: AppBarStyle,
          ),
          backgroundColor: PrimaryRed1),
      body: Container(
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
      ),
    );
  }
}
