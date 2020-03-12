import 'package:crew_brew/screens/models/user.dart';
import 'package:crew_brew/screens/wrapper.dart';
import 'package:crew_brew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(), 
      ),   
    );
  }
}

