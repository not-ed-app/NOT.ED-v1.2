import 'package:flutter/material.dart';
import 'package:noted_app/ui/about.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
hello

class Profile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  GestureDetector ExternalAppicationLink(String text, int iconCode, String url){
    return GestureDetector(
      onTap:() => _launchURL(url),
      child: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 30.0, left: 25.0),
          child: Row(
            children: <Widget>[
              Container(width: 40.0, child: Icon(
                  IconData(iconCode, fontFamily: 'MaterialIcons',), color: Colors.grey,)),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(text, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
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
                      image: AssetImage('assets/woman.png'), height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Sophia Parker", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 70.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Manage your Account Pressed");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Manage your Account", style: TextStyle(fontSize: 16.0, color: Colors.lightBlueAccent, fontWeight: FontWeight.w400),),
                    ),
                  )
              ),
              //Line
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 1.0,
                color: Colors.grey[600],),

              //Upload
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: GestureDetector(
                  //onTap: () =>
                  child: Row(
                    children: <Widget>[
                      Container(width: 40.0, child: Icon(
                        IconData(0xe2c3, fontFamily: 'MaterialIcons',), color: Colors.grey,)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          // onTap: () => _getfile(),
                            child: Text("Upload", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),)),
                      ),
                    ],
                  ),
                ),
              ),

              //Purchased notes
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: GestureDetector(
                  //onTap: () =>
                  child: Row(
                    children: <Widget>[
                      Container(width: 40.0, child: Icon(
                        IconData(0xe02f, fontFamily: 'MaterialIcons',), color: Colors.grey,)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Purchased notes", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                ),
              ),

              //Uploaded notes
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: GestureDetector(
                  //onTap: () =>
                  child: Row(
                    children: <Widget>[
                      Container(width: 40.0, child: Icon(
                        IconData(0xe39d, fontFamily: 'MaterialIcons',), color: Colors.grey,)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Uploaded notes", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                ),
              ),

              //Switch accounts
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: GestureDetector(
                  //onTap: () =>
                  child: Row(
                    children: <Widget>[
                      Container(width: 40.0, child: Icon(
                        IconData(0xe933, fontFamily: 'MaterialIcons',), color: Colors.grey,)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Switch accounts", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                ),
              ),

              //CamScanner
              ExternalAppicationLink("CamScanner", 0xe879, 'https://play.google.com/store/apps/details?id=com.intsig.camscanner'),

              //Line
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 1.0,
                color: Colors.grey[600],),

              //Settings
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: GestureDetector(
                  //onTap: () =>
                  child: Row(
                    children: <Widget>[
                      Container(width: 40.0, child: Icon(
                        IconData(0xe8b8, fontFamily: 'MaterialIcons',), color: Colors.grey,)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("Settings", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                ),
              ),

              //About
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => aboutPage())),
                  child: Row(
                    children: <Widget>[
                      Container(width: 40.0, child: Icon(
                        IconData(0xe88e, fontFamily: 'MaterialIcons',), color: Colors.grey,)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("About", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
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

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // _getfile() async {
  //   String filePath = await FilePicker.getFilePath(type: FileType.any);
  //   //File file = await FilePicker.getFile();
  // }
}
