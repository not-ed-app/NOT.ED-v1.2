import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PinnedNotesBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color pdfThumbnailBorder = Colors.grey[300];
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn == true) {
      pdfThumbnailBorder = Colors.grey[900];
    }
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 240,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('PinnedNotes')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            } else if (!snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Couldn't connect to the server.",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, position) {
                    DocumentSnapshot featNotes = snapshot.data.docs[position];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 144,
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(color: pdfThumbnailBorder),
                          image: DecorationImage(
                            image: NetworkImage(featNotes.data()['Thumbnail']),
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.dstATop),
                            fit: BoxFit.cover,
                            // alignment: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  featNotes.data()['Subject'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlueAccent),
                                ))),
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  "Module " + featNotes.data()['Module'],
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ))),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
