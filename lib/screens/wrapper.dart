import 'package:flutter/material.dart';
import 'package:mum_k4/models/users.dart';
import 'package:mum_k4/screens/authenticate/authenticate.dart';
import 'package:mum_k4/screens/user/hwrapper.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);
    // print(user.uid);
    //retrun either home or authenticate wisget
    if(user == null){
      return Authenticate();
    }else {
      return Hwrapper();
    }
  }
}