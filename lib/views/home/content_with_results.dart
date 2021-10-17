
import 'package:flutter/material.dart';
import 'package:my_cloud_teste/widgets/horizontal_card.dart';

import '../../style.dart';
import '../detail_movie.dart';

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