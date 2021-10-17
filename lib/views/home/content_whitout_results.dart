import 'package:flutter/material.dart';

import '../../style.dart';

class ContentWithoutResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.not_interested,
                    size: 24,
                    color: Gray5,
                  ),
                ),
                TextSpan(
                  text: " Sem resultados",
                  style: TextStyle(
                      color: Gray5,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontNameDefaultBody,
                      fontSize: 22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}