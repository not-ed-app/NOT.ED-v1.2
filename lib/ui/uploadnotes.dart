import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
//import 'package:uuid/uuid.dart';

//import 'package:path/path.dart';
import 'package:noted_app/upload/dbevent.dart';

class ProfilePage extends StatefulWidget {

  
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDetailsController = TextEditingController();
  TextEditingController eventPriceController = TextEditingController();
  String productId = DateTime.now().millisecondsSinceEpoch.toString();  

  File _image;
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
          StorageUploadTask task = storage.ref().child(picture).putFile(_image);    
          StorageUploadTask task2 = storage.ref().child(pdf).putFile(_file);
          task.onComplete.then((snapshot) async {
            imageUrl = await snapshot.ref.getDownloadURL();
            task2.onComplete.then((snapshot) async {
            fileUrl = await snapshot.ref.getDownloadURL();
            String imageL = imageUrl;
            String fileL = fileUrl;
            eventService.uploadDetails(
                title: eventNameController.text,
                details: eventDetailsController.text,
                price: eventPriceController.text,
                file: fileL,    
                image: imageL
                );
            _formKey.currentState.reset();
            setState(() => isLoading = false);
             Fluttertoast.showToast(msg: 'Notes added',toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,
            backgroundColor: Colors.orangeAccent,textColor: Colors.white,fontSize: 16.0);
           // Navigator.pop(context);
          });
          });
        } else {
          setState(() => isLoading = false);
          Fluttertoast.showToast(msg: 'All details must be provided',textColor: Colors.black);
        }
      }
    }

Future getFile() async {
      File result = await FilePicker.getFile(
        type: FileType.custom,allowedExtensions: ['pdf'],
      );
     
      setState(() {
        _file = result;
        print('file Path $result');
Fluttertoast.showToast(msg: 'PDF Uploaded',toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue[300],textColor: Colors.white,fontSize: 16.0);
      }
      );
    }

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
 File result = await FlutterNativeImage.compressImage(image.path,
    quality: 2);
      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
//         actions: [
           
           
//           IconButton(
            
//             icon: Icon(Icons.delete),
//             onPressed:()async{
//               try{ 
//              await FirebaseFirestore.instance.collection('eNotification').doc().delete();
//              Fluttertoast.showToast(msg: 'Notification Deleted',toastLength: Toast.LENGTH_LONG,
//             gravity: ToastGravity.CENTER,
//             backgroundColor: Colors.purple,
//             textColor: Colors.white,fontSize: 16.0);
//             } 
//             catch(e){
// print(e.toString());
//             }}
//           )
  
//         ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                //  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height *.02),
                      child: Align(
                        alignment: Alignment.center,
                        child: OutlineButton(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.width * .3,
                            child: (_image != null)
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  )
                                : Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.only(top:MediaQuery.of(context).size.width * .1),
                      child: TextFormField(
                        controller: eventNameController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Title',
                          labelText: 'Title',
                        ),
                       validator: (value){
                         if(value.isEmpty){
                           return 'You must enter the Title';
                         }
                       },

                      ),
                    ),
                    TextFormField(
                      
                      controller: eventDetailsController,
                      decoration:  InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Details',
                        labelText: 'Details',
                      ),
                     validator: (value){
                       if(value.isEmpty){
                         return 'You must enter some words';
                       }
                      //  if(value.length > 50){
                      //     return 'Should be less than 50 characters';
                      //  }
                     },
                    ),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: eventPriceController,
                      decoration:  InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Price',
                        labelText: 'Price',
                      ),
                     validator: (value){
                         if(value.isEmpty){
                           return 'You must give a Price';
                         }
                       },
                    ),
                                                  
                    SizedBox(
                      height:MediaQuery.of(context).size.width * .1,
                    ),
                   
                  //  Align(
                  //       alignment: Alignment.center,
                  //       child: OutlineButton(
                  //         child: Container(
                  //           width: MediaQuery.of(context).size.width * .3,
                  //           height: MediaQuery.of(context).size.width * .3,
                  //           child: (_file != null)
                  //               ? Image.file(
                  //                   _file,
                  //                   fit: BoxFit.fill,
                  //                 )
                  //               : Icon(
                  //                   Icons.add,
                  //                   color: Colors.grey,
                  //                 ),
                  //         ),
                  //         onPressed: () {
                  //           getFile();
                            
                  //         },
                  //       ),
                  //     ),
                    RaisedButton(
                      color: Colors.deepOrange,
                      onPressed: () {
                        getFile();
                      },
                      elevation: 4.0,
                      splashColor: Colors.orange[200],
                      child: Text(
                        'Upload(.PDF)',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),

                    SizedBox(
                      height:MediaQuery.of(context).size.width * .3,
                    ),

                    RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: () {
                        validateAndUpload();
                      },
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
