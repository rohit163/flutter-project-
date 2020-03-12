import 'package:crew_brew/screens/authenticate/authentcate.dart';
import 'package:crew_brew/screens/home/home.dart';
import 'package:crew_brew/screens/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    //return either authenticate or home
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }

  }
}