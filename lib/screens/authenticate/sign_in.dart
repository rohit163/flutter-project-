import 'package:crew_brew/services/auth.dart';
import 'package:crew_brew/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {



   final Function toggleView;
   SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

      final _formKey = GlobalKey<FormState>();
      final AuthService _auth = AuthService();

      //text feild state
      String email = '';
          String error = '';
      String password ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon
          (onPressed:() {
            widget.toggleView();

          },
           icon: Icon(Icons.person), 
           label: Text('Register')
           )
         
        ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
          child:Form(
            key: _formKey,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>val.isEmpty? 'Enter an Email' :null,
                  onChanged: (val) {
                    setState(()=> email = val);
                  }
                ),
                SizedBox(height: 20.0),
                    TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) =>val.length< 6? 'Enter an Pass 6 chars long' :null,
                      obscureText: true,
                    onChanged: (val) {     
                    setState(()=> password = val);

                    }
                  ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() => error = 'could not sign in with those credentials');
                    }
                    }
                  }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
              ) ,
            )
        ),
     );
  }
}