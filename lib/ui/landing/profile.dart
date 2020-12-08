import 'package:flutter/material.dart';
import 'profile/about.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile/upload/upload_notes.dart';

class Profile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Container ExternalAppicationLink(String text, int iconCode, String url) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 30.0, left: 25.0),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => _launchURL(url),
        child: Row(
          children: <Widget>[
            Container(
                width: 40.0,
                child: Icon(IconData(iconCode, fontFamily: 'MaterialIcons'))),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/woman.png'),
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Sophia Parker",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  print("Manage your Account Pressed");
                },
                child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 70.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Manage your Account",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
              ),
              //Line
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 1.0,
                color: Colors.grey[600],
              ),

              //Upload
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>UploadNotes())),
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          child: Icon(
                              IconData(60073, fontFamily: 'MaterialIcons'))),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Upload",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Purchased notes
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          child: Icon(
                              IconData(59407, fontFamily: 'MaterialIcons'))),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Purchased notes",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Uploaded notes
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                // onTap:
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          child: Icon(
                              IconData(0xe39d, fontFamily: 'MaterialIcons'))),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Uploaded notes",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //ExternalAppication
              ExternalAppicationLink("Adobe Scan", 0xe879,
                  'https://acrobat.adobe.com/in/en/mobile/scanner-app.html'),
              //Line
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 1.0,
                color: Colors.grey[600],
              ),

              //Settings
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          child: Icon(
                              IconData(62530, fontFamily: 'MaterialIcons'))),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //About
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage())),
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          child: Icon(
                              IconData(59353, fontFamily: 'MaterialIcons'))),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "About",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
