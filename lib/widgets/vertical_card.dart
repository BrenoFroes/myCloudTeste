import 'package:flutter/material.dart';
import 'package:my_cloud_teste/movie/movie_image.dart';

import '../style.dart';

class VerticalCard extends StatelessWidget {
  String title = '';
  String poster_path = '';

  VerticalCard(this.title, this.poster_path);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 120.0,
        height: 50.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MovieImage(
                  poster_path: poster_path,
                  width: 80.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  title,
                  style: SubtitleCard,
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
