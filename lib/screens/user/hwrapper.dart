import 'package:flutter/material.dart';
import 'package:mum_k4/models/users.dart';
import 'package:mum_k4/screens/user/BSS/home.dart';
import 'package:mum_k4/screens/user/karyakar/home.dart';
import 'package:mum_k4/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mum_k4/screens/user/admin/home.dart';
class Hwrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
      return new StreamBuilder(
        stream:
          Firestore.instance.collection('users').document(user.uid).snapshots(),
          builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          }
          var userDocument = snapshot.data;
          print(userDocument["post"]);
          if(userDocument["post"] == 'karyakar')
          return Khome();
          else if (userDocument["post"] == 'bss')
          return Bhome();
          else if (userDocument["post"] == 'admin')
          return Ahome();
        return Loading();
        });
    // return StreamProvider<QuerySnapshot>.value(
    //   value: DatabaseService().karyakar,
    //   child: Scaffold(
    //     backgroundColor: Colors.grey[900],
    //     appBar: AppBar(
    //       title: Text('Mumbai K4'),
    //       backgroundColor: Colors.orange[600],
    //       elevation: 0.0,
    //       actions: <Widget>[
    //         FlatButton.icon(
    //           icon: Icon(Icons.person),
    //           label: Text('logout'),
    //           onPressed: () async {
    //             await _auth.signOut();
    //           },
    //         ),
    //       ],
    //     ),
    //     body: KaryakarList(),
    //   ),
    // );
  }
}
