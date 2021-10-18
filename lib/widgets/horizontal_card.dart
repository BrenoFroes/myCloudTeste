import 'package:flutter/material.dart';
import 'package:my_cloud_teste/movie/movie_image.dart';

import '../style.dart';

class HorizontalCard extends StatelessWidget {
  String title = '';
  String poster_path = '';

  HorizontalCard(this.title, this.poster_path);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Container(
        width: double.infinity,
        height: 80.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MovieImage(poster_path: poster_path, width: 80.0),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  title,
                  style: TitleCard,
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
