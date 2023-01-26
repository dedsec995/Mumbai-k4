import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mum_k4/models/aahnik.dart';
import 'package:mum_k4/screens/user/admin/report/Daily_Report/DailyAahnikReport.dart';
import 'package:mum_k4/screens/user/admin/report/Daily_Report/report_list.dart';
import 'package:mum_k4/shared/Slide_Right_Transition.dart';
import 'package:mum_k4/services/database.dart';
import 'package:provider/provider.dart';

class SearchDateReport extends StatefulWidget {
  String searchDate;
  SearchDateReport(this.searchDate);
  @override
  _SearchDateReportState createState() =>
      _SearchDateReportState(this.searchDate);
}

class _SearchDateReportState extends State<SearchDateReport> {
  String searchDate;
  _SearchDateReportState(this.searchDate);
  Icon cusIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Aahnik Report K4");
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Aahnik>>.value(
        value: DatabaseService(day: searchDate).report,
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
              title: customSearchBar,
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
            body: ReportList(),
          ),
        ));
  }
}
