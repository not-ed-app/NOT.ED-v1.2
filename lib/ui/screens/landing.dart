import 'package:flutter/material.dart';
import 'package:noted_app/ui/screens/pdfList.dart';
import 'package:noted_app/ui/screens/profile.dart';
import 'package:noted_app/ui/screens/library.dart';
import 'package:noted_app/ui/screens/home.dart';
// import 'pdflist.dart';

// import './searchedsubjectmodel.dart';
// import './searchedsubject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new Landing());

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

// class DataSearch extends SearchDelegate<String> {
//   final subjects = [
//     "MA202 - Probability Distributions,Transforms and Numerical Methods",
//     "CS202 - Computer Organization and Architecture",
//     "CS204 - Operating Systems",
//     "CS206 - Object Oriented Design and Programming",
//     "CS208 - Principles of Database Design",
//     "HS200 - Business Economics"
//   ];

//   final subjectsShort = ["MA202", "CS202", "CS204", "CS206", "CS208", "HS200"];
//   final recentSubjects = [];
//  String queryView;
//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     assert(context != null);
//     final ThemeData theme = Theme.of(context);
//     assert(theme != null);
//     return theme.copyWith(
//       primaryColor: Colors.grey[850],
//       primaryIconTheme:
//           theme.primaryIconTheme.copyWith(color: Colors.deepOrange[400]),
//       //primaryColorBrightness: Brightness.dark,
//       textTheme: theme.textTheme.copyWith(
//         title: TextStyle(fontWeight: FontWeight.normal),
//       ),
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//     return null;
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         icon: AnimatedIcon(
//             icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
//         onPressed: () {
//           close(context, null);
//         });
//     return null;
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final List _userList = [
//       SearchedSubjectModel("★★★★", 5,  "Adarsh Mohan", "https://images2.imgbox.com/33/cc/hqwc0Xl6_o.jpg", "Module 1", "Simple and straight-forward", "MA202"),
//       SearchedSubjectModel("★★★", 7, "Sanjith Devan", "https://images2.imgbox.com/14/36/ZBy6npHv_o.jpg", "Module 2", "Formulas are highlighted", "CS202"),
//       SearchedSubjectModel("★★★", 4, "Jeff Thomas", "https://images2.imgbox.com/7b/a3/9775AwYT_o.png", "Module 3", "Easy to understand, well written", "CS204"),
//       SearchedSubjectModel("★★★", 2, "Jeny Susan", "https://images2.imgbox.com/6d/cb/9JzK2e1m_o.png", "Module 4", "Best for last minute refers", "CS206"),
//       SearchedSubjectModel("★★★★", 6, "Rijo Mathew", "https://images2.imgbox.com/9d/cf/QPU3b9GP_o.jpeg", "Module 5", "Well thought-out", "CS208"),
//       SearchedSubjectModel("★★★", 3, "Jithin James", "https://images2.imgbox.com/14/36/ZBy6npHv_o.jpg", "Module 6", "Easy to understand", "HS200"),
//       ];
//     if (query.toUpperCase() == subjectsShort[0] ||
//         query.toUpperCase() == subjectsShort[1] ||
//         query.toUpperCase() == subjectsShort[2] ||
//         query.toUpperCase() == subjectsShort[3] ||
//         query.toUpperCase() == subjectsShort[4] ||
//         query.toUpperCase() == subjectsShort[5]) {
//       return Container(
//         margin: const EdgeInsets.only(left: 15.0, right: 15.0),
//         child: ListView(
//           /// iterate [SearchedSubjectModel] through _userList
//           children: _userList.map((i) => SearchedSubject(i)).toList(),
//         ),
//       );

//     }
//     else {
//       return Align(
//         alignment: Alignment.bottomCenter,
//         child: Container( margin: const EdgeInsets.all(20.0),
//             child: Text("No such results", style: TextStyle(fontSize: 20.0),)),
//       );
//     }
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty
//         ? recentSubjects
//         : subjects.where((p) => p.startsWith(query.toUpperCase())).toList();
//     return ListView.builder(
//         itemBuilder: (context, int index) => ListTile(
//               onTap: () {
//                 //showResults(context);
//                 return suggestionList[index];
//               },
//               leading: Icon(Icons.book),
//               title: Text(suggestionList[index]),
//             ),
//         itemCount: suggestionList.length);
//     return null;
//   }
// }

//class searchSuggestions extends StatelessWidget{}

class MyAppState extends State<Landing> {
  int _selectedTab = 1;
  final _pageOptions = [
    PDFList(),
    // Home(),
    Library(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: SizedBox(
            height: 20.0,
            child: Image(
              image: AssetImage("assets/Logo-With-Text-To-Right.png"),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                //  showSearch(context: context, delegate: DataSearch());
              },
            ),
            //Image(image: AssetImage("assets/woman.png"), onPressed: () {},)
          ],
        ),
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: new BottomNavigationBar(
          // backgroundColor: Colors.grey[900],
          elevation: 10.0,
          selectedItemColor: Colors.deepOrangeAccent,
          // unselectedItemColor: Colors.grey[400],
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(IconData(62042, fontFamily: 'MaterialIcons')),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(61716, fontFamily: 'MaterialIcons')),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(60570, fontFamily: 'MaterialIcons')),
              label: "Profile",
            ),
          ],
        ));
    //);
  }
}
