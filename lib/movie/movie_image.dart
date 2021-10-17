import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future<String?> imageUrl() async {
    link = baseImgUrl + '/$size/' + widget.poster_path;
    try {
      var response = await http.get(
        link,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      );
      if (response.statusCode == 200) {
        return link;
      }
    } catch (e) {
      return 'https://png.pngtree.com/element_our/20190530/ourlarge/pngtree-cinema-movie-icon-image_1233832.jpg';
    }
  }

  void initState() {
    imageUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      child: Image.network(link),
    );
  }
}
