import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'home/loading_widget.dart';

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color pdfThumbnailBorder = Colors.grey[300];
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn == true) {
      pdfThumbnailBorder = Colors.grey[900];
    }
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('eUpload')
              .orderBy("publishedDate", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            } else if (!snapshot.hasData) {
              return Center(
                child: Text("Couldn't connect to the server."),
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
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: pdfThumbnailBorder)),
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
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              listOfPdf
                                                  .data()['title']
                                                  .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.lightBlueAccent,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              listOfPdf.data()['details'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              DateFormat.yMMMd()
                                                  .add_jm()
                                                  .format(DateTime.parse(
                                                      listOfPdf
                                                          .data()[
                                                              'publishedDate']
                                                          .toDate()
                                                          .toString())),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.orange[300],
                                                  fontWeight: FontWeight.w300),
                                            ),
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
