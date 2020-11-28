import 'package:flutter/material.dart';
import './librarysubjectmodel.dart';
import './librarysubject.dart';

class Library extends StatelessWidget {
  final List _userList = [
    LibrarySubjectModel("Just now", 5,  "Adarsh Mohan", "https://images2.imgbox.com/33/cc/hqwc0Xl6_o.jpg", "Module 2", "Simple and straight-forward", "MA202", "★★★★"),
    LibrarySubjectModel("06-May-2020", 7, "Sanjith Devan", "https://images2.imgbox.com/14/36/ZBy6npHv_o.jpg", "Module 4", "Formulas are highlighted", "CS202", "★★★"),
    LibrarySubjectModel("28-Apr-2020", 4, "Jeff Thomas", "https://images2.imgbox.com/7b/a3/9775AwYT_o.png", "Module 5", "Easy to understand, well written", "CS204", "★★★"),
    LibrarySubjectModel("17-Apr-2020", 2, "Jeny Susan", "https://images2.imgbox.com/6d/cb/9JzK2e1m_o.png", "Module 4", "Best for last minute refers", "CS206", "★★★"),
    LibrarySubjectModel("12-Apr-2020", 6, "Rijo Mathew", "https://images2.imgbox.com/9d/cf/QPU3b9GP_o.jpeg", "Module 3", "Well thought-out", "CS208", "★★★★"),
    LibrarySubjectModel("11-Mar-2020", 3, "Jithin James", "https://images2.imgbox.com/14/36/ZBy6npHv_o.jpg", "Module 1", "Easy to understand", "HS200", "★★★"),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
                /// iterate [SearchedSubjectModel] through _userList
                children: _userList.map((i) => LibrarySubject(i)).toList(),
              ),
        ),
        );
  }
}
