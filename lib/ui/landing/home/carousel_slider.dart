import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselSliderBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color carouselSliderFill = Colors.grey[300];
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn == true) {
      carouselSliderFill = Colors.grey[900];
    }
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('CarouselSlider').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          } else if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Couldn't connect to the server.",
                  style: TextStyle(fontSize: 10),
                ),
              ),
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
                    DocumentSnapshot images = snapshot.data.docs[position];
                    return Container(
                      child: GestureDetector(
                        onTap: () => _launchURL(images.data()['ExternalURL']),
                        child: Image.network(
                          images.data()['ImagePath'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
            );
          }
        });
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
