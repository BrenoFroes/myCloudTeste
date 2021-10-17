import 'package:flutter/material.dart';
import 'package:my_cloud_teste/movie/movie_list_page.dart';

import '../../style.dart';

class PresetContent extends StatelessWidget {
  var response;
  var popularMovieListPage;
  var nowPlayingMovieListPage;
  
  PresetContent(){
    this.response;
    this.popularMovieListPage = new MovieListPage(call: 'popular');
    this.nowPlayingMovieListPage = new MovieListPage(call: 'nowPlaying');
  }

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
