// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_cloud_teste/style.dart';
import 'package:my_cloud_teste/widgets/card_body.dart';
import 'package:my_cloud_teste/widgets/vertical_card.dart';

import 'movie/movie_list_page.dart';

class HomePage extends StatelessWidget {
  TextEditingController movieCtrl = new TextEditingController();
  var movieListPage = new MovieListPage();
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
            GestureDetector(
              child: CardBody('Oi', 'Ola'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SurveyPage(plate: _placaBody),
                //   ),
                // );
              },
            ),
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
            Expanded(child: movieListPage),
          ],
        ),
      ),
    );
  }
}
