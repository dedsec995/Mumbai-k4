import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mum_k4/models/UsersList.dart';
import 'package:mum_k4/services/database.dart';
import 'package:provider/provider.dart';

import 'MonthlyReportList.dart';

class MonthlyAahnikReport extends StatefulWidget {
  MonthlyAahnikReport();
  @override
  _MonthlyAahnikReportState createState() => _MonthlyAahnikReportState();
}

class _MonthlyAahnikReportState extends State<MonthlyAahnikReport> {
  _MonthlyAahnikReportState();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UsersList>>.value(
        value: DatabaseService().monthlyReport,
        child: Container(
        //   decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/red_blue_back.png"),
        //     fit: BoxFit.cover,
        //     // alignment: Alignment.bottomLeft,
        //   ),
        // ),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Monthly Report"),
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
            body: MonthlyReportList(),
          ),
        ));
  }
}
