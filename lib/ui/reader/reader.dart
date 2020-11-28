import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Reader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PDFReader();
}

class PDFReader extends State<Reader> {
  bool _isLoading = false, _isInit = true;
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _isInit
                  ? Text(
                      'Press Load',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  : _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : PDFViewer(
                          document: document,
                        ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              /*Expanded(
            child: MaterialButton(
              child: Text("Assets"),
              onPressed: () {
                loadFromAssets();
              },
            ),
          ),*/
              Expanded(
                child: MaterialButton(
                  child: Text("Load",
                      style: TextStyle(fontSize: 23, color: Colors.grey[850])),
                  color: Colors.deepOrange[400],
                  height: 40.0,
                  //minWidth: 80.0,
                  onPressed: () {
                    loadFromURL();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /*loadFromAssets() async {
    setState(() {
      _isInit = false; //remove Text
      _isLoading = true; //show loading
    });
    document = await PDFDocument.fromAsset('asset/OS1.pdf');
    setState(() {
      _isLoading = false; //remove loading
    });
   }*/

  loadFromURL() async {
    setState(() {
      _isInit = false; //remove Text
      _isLoading = true; //show loading
    });
    document = await PDFDocument.fromURL('https://www.cfa.harvard.edu/seuforum/howfar/HowBigUniverse.pdf');

    setState(() {
      _isLoading = false; //remove loading
    });
  }
}
