import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:mum_k4/models/users.dart';
import 'package:mum_k4/screens/user/karyakar/kaahnik.dart';
import 'package:mum_k4/services/auth.dart';
import 'package:mum_k4/shared/Slide_Right_Transition.dart';
import 'package:mum_k4/shared/loading.dart';
import 'package:provider/provider.dart';

class Khome extends StatefulWidget {
  @override
  _KhomeState createState() => _KhomeState();
}

class _KhomeState extends State<Khome> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          }
          var userDocument = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Karyakar K4'),
              // backgroundColor: Colors.orange[600],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.red, Colors.blue]),
                ),
              ),
              elevation: 0.0,
              // actions: <Widget>[
              // ],
            ),
            drawer: Drawer(
                child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: Text(userDocument["name"]),
                  accountEmail: Text(userDocument["mandal"]),
                  currentAccountPicture: new GestureDetector(
                    child: new CircleAvatar(
                      // backgroundColor: Colors.deepPurple,
                      backgroundImage: AssetImage('assets/home.jpeg'),
                    ),
                  ),
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: GradientColors.noontoDusk),
                    image: new DecorationImage(
                      // fit: BoxFit.fill,
                      image: new AssetImage('assets/accback.png'),
                    ),
                  ),
                ),
                ButtonTheme(
                  // minWidth: 200.0,
                  height: 70.0,
                  child: FlatButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('My Aahnik'),
                    onPressed: () {
                      Navigator.push(
                          context, SlideRightRoute(page: Kaahnik()));
                    },
                  ),
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  height: 70,
                  child: FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('logout',textAlign: TextAlign.left,),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                  ),
                ),
              ],
            )),
            body: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 200,
                        width: 200,
                        child:
                            Lottie.asset('assets/under_construction.json')),
                    // Container(
                    //     height: 200,
                    //     width: 200,
                    //     child: Lottie.asset('assets/rumble.json')),
                    Container(
                      child: Text("Under Construction"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
