import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: ListView(
        children: <Widget>[
          //Privacy Policy & Terms of Service
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: GestureDetector(
                      onTap: () => _launchURL('https://policies.google.com/privacy?hl=en-US'),
                      child: Text("Privacy Policy\n", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),)),
                ),
                Container(
                  child: GestureDetector(
                      onTap: () => _launchURL("https://www.google.com/intl/en_ZZ/policies/terms/archive/20070416/"),
                      child: Text("Terms of Service", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}




