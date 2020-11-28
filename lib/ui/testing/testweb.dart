import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestWeb extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: GestureDetector(
              onTap: () => _launchURL(),
              child: Text('Show Flutter homepage')),
        ),
      );

  }

}

_launchURL() async {
  const url = 'https://www.youtube.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
