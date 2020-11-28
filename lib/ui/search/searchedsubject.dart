import "package:flutter/material.dart";
import 'searchedsubjectmodel.dart';
import 'searchedsubjectdetail.dart';

class SearchedSubject extends StatelessWidget {
  final SearchedSubjectModel _uploadedpdf;

  SearchedSubject(this._uploadedpdf);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchedSubjectDetail(_uploadedpdf))),
      child: Container(
        /// Give nice padding
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            /// This is the important part, we need [Hero] widget with unique tag for this item.
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.yellow,
                  //alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            image: NetworkImage(_uploadedpdf.thumbnail),
                            height: 200.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "₹ " + _uploadedpdf.cost.toString(),
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _uploadedpdf.name,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _uploadedpdf.rating.toString(),
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.orange[300],
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: 1.0,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
