import 'package:flutter/material.dart';
import 'package:mum_k4/services/auth.dart';

class Bhome extends StatefulWidget {
  @override
  _BhomeState createState() => _BhomeState();
}

class _BhomeState extends State<Bhome> {
  final AuthService _auth = AuthService();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text('BSS K4'),
            backgroundColor: Colors.orange[600],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
          body: Text("This is BSS"),
        );
    }
}