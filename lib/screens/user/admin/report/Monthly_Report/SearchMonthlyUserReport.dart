import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mum_k4/models/aahnik.dart';
import 'package:mum_k4/screens/user/admin/report/Monthly_Report/dataTableList.dart';
import 'package:mum_k4/services/database.dart';
import 'package:provider/provider.dart';

class SearchMonthlyUserReport extends StatefulWidget {
  String searchMonth;
  String searchName;
  SearchMonthlyUserReport(  {this.searchName, this.searchMonth});
  @override
  _SearchMonthlyUserReportState createState() => _SearchMonthlyUserReportState(searchName: this.searchName,searchMonth: this.searchMonth);
}

class _SearchMonthlyUserReportState extends State<SearchMonthlyUserReport> {
  String searchMonth;
  String searchName;
  _SearchMonthlyUserReportState({this.searchName, this.searchMonth});
  Icon cusIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Aahnik Report K4");
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Aahnik>>.value(
        value: DatabaseService(searchName: searchName,month: searchMonth).monthlyuserreport,
        child: Scaffold(
          backgroundColor: Colors.white,
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
          body: MonthlyDataTableList(),
        ));
  }
}
