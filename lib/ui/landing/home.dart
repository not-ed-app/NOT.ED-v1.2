import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text("working on it",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Image.network(
                "https://media.giphy.com/media/S8NXobELAKkPUR2evj/giphy.gif",
                // fit: BoxFit.cover,
                // height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
