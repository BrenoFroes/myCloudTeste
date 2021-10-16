import 'package:flutter/material.dart';

import '../style.dart';

class VerticalCard extends StatelessWidget {
  String title = '';
  String subtitle = '';

  VerticalCard(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Container(
        width: 130.0,
        height: 80.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                      Container(
                        width: 50.0,
                        height: 50.0,
                        child: Image.network("https://i.imgur.com/BoN9kdC.png"),
                      ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: SubtitleCard,
                ),
                Text(
                  subtitle,
                  style: Body1TextStyle,
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
