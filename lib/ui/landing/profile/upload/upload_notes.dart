import 'package:flutter/material.dart';
import 'db_event.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
//import 'package:uuid/uuid.dart';

//import 'package:path/path.dart';

class UploadNotes extends StatefulWidget {
  @override
  _UploadNotesState createState() => _UploadNotesState();
}

class _UploadNotesState extends State<UploadNotes> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDetailsController = TextEditingController();
  TextEditingController eventPriceController = TextEditingController();
  String productId = DateTime.now().millisecondsSinceEpoch.toString();

  File _image;
  String _pdfName;
  var _file;
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EventService eventService = EventService();

  @override
  Widget build(BuildContext context) {
    // var id =Uuid();
    // var pEventId = id.v1();
    void validateAndUpload() {
      if (_formKey.currentState.validate()) {
        setState(() => isLoading = true);
        if (_image != null && _file != null) {
          String imageUrl;
          String fileUrl;
          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture =
              "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          final String pdf =
              "${DateTime.now().millisecondsSinceEpoch.toString()}.pdf";
          UploadTask imageUpload = storage.ref().child(picture).putFile(_image);
          UploadTask pdfUpload = storage.ref().child(pdf).putFile(_file);
          imageUpload.then((snapshot) async {
            imageUrl = await snapshot.ref.getDownloadURL();
            pdfUpload.then((snapshot) async {
              fileUrl = await snapshot.ref.getDownloadURL();
              String imageL = imageUrl;
              String fileL = fileUrl;
              eventService.uploadDetails(
                  title: eventNameController.text,
                  details: eventDetailsController.text,
                  price: eventPriceController.text,
                  file: fileL,
                  image: imageL);
              _formKey.currentState.reset();
              setState(() => isLoading = false);
              Fluttertoast.showToast(
                  msg: 'Note added',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER);
            });
          });
        } else {
          setState(() => isLoading = false);
          Fluttertoast.showToast(msg: 'All details must be provided');
        }
      }
    }

    Future getFile() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        print(file.name);
        _pdfName = file.name;
        setState(() {
          _file = file;
          print('file Path $result');
          Fluttertoast.showToast(msg: 'PDF added');
        });
      } else {
        // User canceled the picker
        Fluttertoast.showToast(msg: 'PDF not selected');
      }
    }

    Future getImage() async {
      final picker = ImagePicker();
      final image = await picker.getImage(source: ImageSource.gallery);
      File result =
          await FlutterNativeImage.compressImage(image.path, quality: 70);
      if (result != null) {
        setState(() {
          _image = result;
          print('file Path $result');
          Fluttertoast.showToast(msg: 'Image added');
        });
      } else {
        // User canceled the picker
        Fluttertoast.showToast(msg: 'Image not selected');
      }
    }

    Color buttonOutline = Colors.grey[300];
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn == true) {
      buttonOutline = Colors.grey[600];
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Upload'),
            GestureDetector(
              // onTap: ,
              child: Text("Instructions",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.deepOrangeAccent)),
            )
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      border: Border.all(color: buttonOutline)),
                  width: 144.0,
                  height: 240.0,
                  child: InkWell(
                    child: (_image != null)
                        ? Image.file(
                            _image,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Select image"),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      getImage();
                    },
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: Border.all(color: buttonOutline)),
                    child:
                        (_pdfName != null) ? Text(_pdfName) : Container(
                          width: 144,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.note_add_rounded,
                              ),
                              Text('Select note'),
                            ],
                          ),
                        ),
                  ),
                  onTap: () {
                    getFile();
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  maxLength: 20,
                  textCapitalization: TextCapitalization.characters,
                  controller: eventNameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.title),
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  maxLength: 40,
                  textCapitalization: TextCapitalization.sentences,
                  controller: eventDetailsController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.short_text),
                    labelText: 'Details',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the details';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: eventPriceController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on_outlined),
                    hintText: 'Price',
                    labelText: 'Price',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must give a price';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      validateAndUpload();
                    },
                    // elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
