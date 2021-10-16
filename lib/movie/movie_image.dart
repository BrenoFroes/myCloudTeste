import 'package:flutter/material.dart';

class MovieImage extends StatefulWidget {
  String poster_path;

  MovieImage({Key? key, required this.poster_path}) : super(key: key);

  @override
  _MovieImageState createState() => _MovieImageState();
}

class _MovieImageState extends State<MovieImage> {
  var baseImgUrl = "https://image.tmdb.org/t/p";
  var size = "w500";

  var link;

  void initState() {
    link = baseImgUrl + '/$size/' + widget.poster_path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      child: Image.network(link),
    );
  }
}
