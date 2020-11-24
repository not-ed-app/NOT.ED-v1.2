import 'package:flutter/material.dart';
import 'package:noted_app/ui/screens/login.dart';
import 'package:noted_app/ui/screens/signin.dart';
import 'package:noted_app/ui/screens/signup.dart';
import 'package:noted_app/ui/screens/home.dart';
import 'package:noted_app/ui/screens/splash_screen.dart';

class NotedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOT.ED',
      // theme: buildTheme(),
     theme: ThemeData(
       // Define the default brightness and colors.
       // brightness: Brightness.dark,
       // primaryColor: Colors.grey[850],
       appBarTheme: AppBarTheme(elevation: 0.1, color: Colors.black87),
       accentColor: Colors.deepOrange[400],
     ),
      //darkTheme: ThemeData.dark(),
      // New code
      //initialRoute: '/login',
      //initialRoute: 'Home()',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
//        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => Home(),
        '/signin': (context) => SignIn(),
        '/signup': (context) => SignUp(),

        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        //'/': (context) => LoginScreen(),
      },
    );
  }
}
