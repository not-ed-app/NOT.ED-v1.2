import 'package:flutter/material.dart';
import 'package:noted_app/ui/screens/login.dart';
import 'package:noted_app/ui/screens/signin.dart';
import 'package:noted_app/ui/screens/signup.dart';
import 'package:noted_app/ui/screens/home.dart';
import 'package:noted_app/ui/screens/splash_screen.dart';

class NotedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOT.ED',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(elevation: 0.1, color: Colors.black),
        accentColor: Colors.deepOrangeAccent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(elevation: 0.1, color: Colors.black),
        accentColor: Colors.deepOrangeAccent,
      ),
      themeMode: ThemeMode.light,
      // ThemeMode.system to follow system theme,
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
    return materialApp;
  }
}
