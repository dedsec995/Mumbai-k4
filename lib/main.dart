import 'package:flutter/material.dart';
import 'package:mum_k4/screens/wrapper.dart';
import 'package:mum_k4/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:mum_k4/models/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( 
      value: AuthService().user,
      child: MaterialApp(
        home:
        Wrapper()
        ),
    );
  }
}