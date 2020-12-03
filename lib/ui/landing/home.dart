import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/carousel_slider.dart';
import 'home/action_chip.dart';
import 'home/featured_notes.dart';
import 'home/pinned_notes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              // CarouselSlider
              CarouselSliderBuilder(),

              // ActionChip
              ActionChipBuilder(),

              // FeaturedNotes
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Featured notes",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500)),
                    GestureDetector(
                        // onTap: () =>,
                        child: Text("See more",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrangeAccent)))
                  ],
                ),
              ),
              FeaturedNotesBuilder(),

              // PinnedNotes
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pinned notes",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500)),
                    GestureDetector(
                        // onTap: () =>,
                        child: Text("See more",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrangeAccent)))
                  ],
                ),
              ),
              PinnedNotesBuilder(),
            ],
          ),
        ],
      ),
    );
  }
}
