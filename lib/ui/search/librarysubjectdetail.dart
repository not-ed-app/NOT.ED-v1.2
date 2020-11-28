import "package:flutter/material.dart";
import 'librarysubjectmodel.dart';
import '../reader/reader.dart';

class LibrarySubjectDetail extends StatelessWidget {
  final LibrarySubjectModel _librarypdf;

  LibrarySubjectDetail(this._librarypdf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                //color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.only(left: 10, top: 5.0),
                          child: Text(_librarypdf.uploader,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 17,color: Colors.white70,))),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        //color: Colors.yellowAccent,
                        padding: EdgeInsets.only(right: 10, top: 5.0),
                        child: Text(_librarypdf.rating.toString(),style: TextStyle(fontWeight: FontWeight.w300,fontSize: 17, color: Colors.orange[300])),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.yellow,
                padding: EdgeInsets.only(top: 30),
                child: Text(_librarypdf.name.toString(),style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w500,color: Colors.white),),),
              Container(
                child: Image(image: NetworkImage(_librarypdf.thumbnail)),
                padding: EdgeInsets.only(top: 30),
                height: 400,
              ),
              Container(
                //color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10.0),
                      child: Text("₹ " + _librarypdf.cost.toString(),style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w300,color: Colors.lightBlueAccent),),),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      height: 2.0,color: Colors.grey[600],),

                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Text("Remark",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300,color: Colors.white),),),

                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Text(_librarypdf.keypoint.toString(),style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300,color: Colors.white),),),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 2.0,color: Colors.grey[600],),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        child: Text('BUY', style: TextStyle(fontSize: 30.0, color: Colors.deepOrangeAccent),),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        child: Text('READ', style: TextStyle(fontSize: 30.0, color: Colors.deepOrangeAccent),),
                        onPressed: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Reader())),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
