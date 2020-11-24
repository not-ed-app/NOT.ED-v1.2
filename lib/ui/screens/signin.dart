import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign In'),
        //backgroundColor: Colors.grey[400],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: AssetImage("assets/logo.png"),
                height: 80.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  //hintText: 'Enter Username',
                  labelText: 'Username',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  //hintText: 'Enter Password',
                  labelText: 'Password',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                //color: Colors.orange[400],
                color: Colors.deepOrange[300],
                height: 80.0,
                minWidth: 200.0,
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 30.0, color: Colors.grey[850]),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
