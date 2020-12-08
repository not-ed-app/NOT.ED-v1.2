import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';


class EventService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'eUpload';


    void uploadDetails({String id,String title,String details, String price,String image,String file,Timestamp publishedDate}){
      var id =Uuid();
      String pEventId = id.v1();
  _firestore.collection(ref).doc(pEventId).set({
    'title' : title,
    'id' : pEventId,
    'description' : details,
    'price' : price,
    'image' : image,
    'publishedDate' : DateTime.now(),
    'file' : file,
  });
  
    }
}