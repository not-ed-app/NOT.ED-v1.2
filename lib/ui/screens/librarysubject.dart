import "package:flutter/material.dart";
import "./librarysubjectmodel.dart";
import "./librarysubjectdetail.dart";
import 'package:cloud_firestore/cloud_firestore.dart';


class LibrarySubject extends StatelessWidget {
  final LibrarySubjectModel _librarypdf;

  LibrarySubject(this._librarypdf);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LibrarySubjectDetail(_librarypdf))),
        child: Container(
          /// Give nice padding
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Image(
                image: NetworkImage(_librarypdf.thumbnail),
                height: 200.0,
              ),
              Container(
                alignment: Alignment.center,
                // color: Colors.red,
                margin: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _librarypdf.subjectname.toString(),
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _librarypdf.name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _librarypdf.date.toString(),
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.orange[300],
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 10.0),
          //   height: 1.0,
          //   color: Colors.grey[600],
          // ),
        ),
      ),
    );
  }
}
