import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // New private method which includes the background image:
    BoxDecoration _buildBackground() {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/landingbg.png"),
          fit: BoxFit.cover,
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: _buildBackground(),
        alignment: Alignment.bottomCenter,
        //padding: EdgeInsets.all(100),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 650,
            ),
            new MaterialButton(
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 30.0, color: Colors.grey[850]),
              ),
              height: 80.0,
              minWidth: 380.0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              color: Colors.grey[400],
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                Navigator.pushNamed(context, '/signin');
                //Navigator.of(context).pushReplacementNamed("/signin");
              },
            ),
            new Container(
              height: 16,
            ),
            new MaterialButton(
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 30.0, color: Colors.grey[850]),
              ),
              height: 80.0,
              minWidth: 380.0,
              //padding: EdgeInsets.all(100),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              color: Colors.grey[400],
              //color: Colors.orangeAccent[100],
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
