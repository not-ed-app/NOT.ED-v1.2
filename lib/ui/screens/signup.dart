import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:noted_app/ui/screens/login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
        //backgroundColor: Colors.grey[400],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(image: AssetImage("assets/woman.png"), height: 80.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  //hintText: 'Enter Username',
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              /*new Container(
                height: 46,
              ),*/
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
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  //hintText: 'Enter Email',
                  labelText: 'Email',
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
                  icon: Icon(Icons.storage),
                  //hintText: 'Enter Semester',
                  labelText: 'Semester',
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
                  icon: Icon(Icons.phone_iphone),
                  //hintText: 'Enter Phone',
                  labelText: 'Phone No.',
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
                  icon: Icon(Icons.account_balance),
                  //hintText: 'Enter College',
                  labelText: 'College',
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
                  icon: Icon(Icons.streetview),
                  //hintText: 'Enter Age',
                  labelText: 'Age',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              /*new Container(
                height: 190,
              ),*/
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                color: Colors.deepOrange[300],
                //color: Colors.orangeAccent[200],
                height: 80.0,
                minWidth: 200.0,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30.0, color: Colors.black54),
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
