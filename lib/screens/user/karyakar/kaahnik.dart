import 'package:flutter/material.dart';
import 'package:mum_k4/models/aahnik.dart';
import 'package:mum_k4/models/users.dart';
import 'package:mum_k4/screens/user/shared/aahnik_add_date.dart';
import 'package:mum_k4/screens/user/shared/aahnik_list.dart';
import 'package:mum_k4/services/database.dart';
import 'package:mum_k4/shared/Scale_Transtion.dart';
import 'package:provider/provider.dart';

class Kaahnik extends StatefulWidget {
  @override
  _KaahnikState createState() => _KaahnikState();
}

class _KaahnikState extends State<Kaahnik> {
  @override
  Widget build(BuildContext context) {
    void _addaahnikdata() {
      Navigator.push(
        context,
        ScaleRoute(page: AddAahnikDate()),
      );
    }

    final user = Provider.of<User>(context);
    return StreamProvider<List<Aahnik>>.value(
        value: DatabaseService(uid: user.uid).aahnik,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/red_blue_back.png"),
              fit: BoxFit.cover,
              // alignment: Alignment.bottomLeft,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Aahnik K4'),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.red, Colors.blue]),
                ),
              ),
              // backgroundColor: Colors.orange[600],
              elevation: 0.0,
              // actions: <Widget>[
              // ],
            ),
            body: AahnikList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _addaahnikdata();
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ),
        ));
  }
}
