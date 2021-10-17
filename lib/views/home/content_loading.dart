import 'package:flutter/material.dart';

import '../../style.dart';

class ContentLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150.0,
        width: 150.0,
        child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Gray5),
            strokeWidth: 10.0),
      ),
    );
  }
}
