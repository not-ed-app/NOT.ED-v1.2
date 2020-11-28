import 'package:flutter/material.dart';
import 'landing/pdfList.dart';
import 'landing/profile.dart';
import 'search/library.dart';

void main() => runApp(new Landing());

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuildLanding();
  }
}

class BuildLanding extends State<Landing> {
  int _selectedTab = 1;
  final _pageOptions = [
    Library(),
    PDFList(),
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
