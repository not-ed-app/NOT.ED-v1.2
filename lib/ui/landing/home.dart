import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color carouselSliderFill = Colors.grey[300];
    Color actionChipBackground = Colors.grey[300];
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn == true) {
      carouselSliderFill = Colors.grey[900];
      actionChipBackground = Colors.grey[900];
    }
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('CarouselSlider')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text("Loading"),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                        child: Text("Couldn't connect to the server."),
                      );
                    } else {
                      return Container(
                        color: carouselSliderFill,
                        padding: EdgeInsets.all(6.0),
                        child: CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 200.0,
                              viewportFraction: 1.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 30),
                              enableInfiniteScroll: false,
                            ),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, position) {
                              DocumentSnapshot images =
                                  snapshot.data.docs[position];
                              return Container(
                                child: GestureDetector(
                                  onTap: () =>
                                      _launchURL(images.data()['ExternalURL']),
                                  child: Image.network(
                                    images.data()['ImagePath'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }),
              Container(
                margin: EdgeInsets.all(8.0),
                height: 50,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('ActionChips')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Text("Loading."),
                        );
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: Text("Couldn't connect to the server."),
                        );
                      } else {
                        return new Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, position) {
                                DocumentSnapshot chips =
                                    snapshot.data.docs[position];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: ActionChip(
                                        backgroundColor: actionChipBackground,
                                        label: Text(chips.data()['Label']),
                                        onPressed: () {
                                          print("Chip Pressed");
                                        }),
                                  ),
                                );
                              }),
                        );
                      }
                    }),
              ),
            ],
          ),
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
