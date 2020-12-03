import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ActionChipBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 50,
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('ActionChips').snapshots(),
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
                    DocumentSnapshot chips = snapshot.data.docs[position];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ActionChip(
                            label: Text(chips.data()['Label']),
                            onPressed: () {
                              print("Chip Pressed");
                            }),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
