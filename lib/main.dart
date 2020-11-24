import 'package:flutter/material.dart';
import 'package:noted_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:device_preview/device_preview.dart';

void main()

 async
  {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(

  //   DevicePreview(
  // builder: (context) => 
    
    new NotedApp()
    
  //  ),
    
    );
}