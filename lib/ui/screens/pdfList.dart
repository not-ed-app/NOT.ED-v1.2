import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "./librarysubjectdetail.dart";
import 'package:intl/intl.dart';

class PDFList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    Color pdfFillColor = Colors.grey[100];
    // final darkFill = Colors.grey[200];
    if (darkModeOn == true) {
      pdfFillColor = Colors.grey[600];
    }
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('eUpload')
              .orderBy("publishedDate", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading"),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text("Sorry no items found"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, position) {
                  DocumentSnapshot listOfPdf = snapshot.data.docs[position];
                  return ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        child: Card(
                          child: InkWell(
                              onTap: () {
                                print("Card Pressed");
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[300])),
                                        child: Image.network(
                                          listOfPdf.data()['image'],
                                          fit: BoxFit.cover,
                                          height: 150.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            listOfPdf.data()['title'].toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.lightBlueAccent,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              listOfPdf.data()['details'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .longestSide *
                                                          0.02,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            DateFormat.yMMMd().add_jm().format(
                                                DateTime.parse(listOfPdf
                                                    .data()['publishedDate']
                                                    .toDate()
                                                    .toString())),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.orange[300],
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
