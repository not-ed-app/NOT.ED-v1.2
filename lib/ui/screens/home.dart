import 'package:flutter/material.dart';
import 'reader.dart';
import 'library.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('eUpload').orderBy("publishedDate", descending: true).snapshots(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: new Text('No Notes'));
            } else if (snapshot.hasError) {
              const Text('No data avaible right now');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myEvent = snapshot.data.docs[index];

//  _launchURL1() async {
//   final url = myEvent.data()['link1'];
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// _launchURL2() async {
//   final url = myEvent.data()['link2'];
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

                    return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
// scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * .03),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Material(
                                    borderRadius: BorderRadius.circular(26.0),
                                    elevation: 4.0,
                                    shadowColor: Colors.grey,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          child: ClipRRect(
                                            borderRadius:
                                                new BorderRadius.circular(24.0),
                                            child: Image.network(
                                              myEvent.data()['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .08,
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .01,
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Container(
                                                          child: Text(
                                                        myEvent.data()['title'],
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .020,
                                                        ),
                                                      )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            bottom: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .005,
                                                            top: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .02,
                                                          ),
                                                          child: Text(
                                                            myEvent.data()[
                                                                'details'],
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Lekton',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .018,
                                                            ),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            bottom: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .005,
                                                            top: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .01,
                                                          ),
                                                          child: Text(
                                                            myEvent.data()[
                                                                    'price'] +
                                                                "rs",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Ubuntu',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors
                                                                  .blueGrey,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .021,
                                                            ),
                                                          )),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))),
                          )
                        ]);
                  });
            }
          }),
    );
  }
}
