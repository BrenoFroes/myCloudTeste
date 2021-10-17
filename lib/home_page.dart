// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_cloud_teste/movie/movie_block.dart';
import 'package:my_cloud_teste/style.dart';
import 'package:my_cloud_teste/views/detail_movie.dart';
import 'package:my_cloud_teste/views/home/content_loading.dart';
import 'package:my_cloud_teste/views/home/content_whitout_results.dart';
import 'package:my_cloud_teste/views/home/content_with_results.dart';
import 'package:my_cloud_teste/views/home/preset_content.dart';
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
