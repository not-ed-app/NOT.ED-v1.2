import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [Icon(Icons.cloud), Text("Loading")],
        ),
      ),
    );
  }
}
