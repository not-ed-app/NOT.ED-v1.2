import 'package:flutter/material.dart';
import 'package:noted_app/ui/landing.dart';

class NotedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOT.ED',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(elevation: 1, color: Colors.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white, unselectedItemColor: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        accentColor: Colors.deepOrangeAccent,
      ),
      darkTheme: ThemeData(
        fontFamily: 'OpenSans',
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(elevation: 0.1, color: Colors.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.grey[900], unselectedItemColor: Colors.white),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
        accentColor: Colors.deepOrangeAccent,
      ),
      themeMode: ThemeMode.system,
      // ThemeMode.system to follow system theme,
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
//        '/': (context) => SplashScreen(),
        '/landing': (context) => Landing(),
      },
    );
    return materialApp;
  }
}
