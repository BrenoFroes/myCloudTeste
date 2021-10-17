import 'package:flutter/material.dart';
import 'package:my_cloud_teste/models/movie_model.dart';
import 'package:my_cloud_teste/movie/movie_block.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_cloud_teste/movie/movie_image.dart';
import 'package:my_cloud_teste/style.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailMovie extends StatefulWidget {
  var movie;
  DetailMovie({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  _launchURL(String title) async {
    var url = 'https://www.google.com/search?q=' + title;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do filme'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MovieImage(poster_path: widget.movie.backdrop_path),
                    Text(widget.movie.title, style: TitleTextStyle),
                    Text(widget.movie.original_title, style: TitleCard),
                    Text(widget.movie.description, style: SubtitleCard),
                    ElevatedButton(
                      onPressed: () => _launchURL(widget.movie.title),
                      child: new Text('Acessar'),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
