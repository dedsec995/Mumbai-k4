import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mum_k4/models/aahnik.dart';
import 'package:mum_k4/screens/user/admin/report/Monthly_Report/dataTableList.dart';
import 'package:mum_k4/services/database.dart';
import 'package:mum_k4/shared/Size_Transition.dart';
import 'package:provider/provider.dart';

import 'SearchMonthlyUserReport.dart';

class MonthlyUserReport extends StatefulWidget {
  String searchName;
  MonthlyUserReport(this.searchName);
  @override
  _MonthlyUserReportState createState() => _MonthlyUserReportState(this.searchName);
}

class _MonthlyUserReportState extends State<MonthlyUserReport> {
  String searchName;
  var day;
  var prevday;
  var today;
  var montharray;
  String month;
  String monthstring;

  _MonthlyUserReportState(this.searchName);
  Icon cusIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Monthly Report");
  @override
  Widget build(BuildContext context) {
          day = new DateTime.now();
          prevday = new DateTime(day.year, day.month, day.day - 1);
          if(day.hour < 12){
            today = prevday.toString().split(" ");
            monthstring = today[0].toString();
            montharray = monthstring.split("-");
            month = montharray[0] + '-' + montharray[1];
          }
          else{
            today = day.toString().split(" ");
            monthstring = today[0].toString();
            montharray = monthstring.split("-");
            month = montharray[0] + '-' + montharray[1];
          }
    return StreamProvider<List<Aahnik>>.value(
        value: DatabaseService(searchName: searchName, month: month).monthlyuserreport,
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
            actions: <Widget>[
              IconButton(
                icon: cusIcon,
                onPressed: () {
                  setState(() {
                    if (this.cusIcon.icon == Icons.search) {
                      this.cusIcon = Icon(Icons.cancel);
                      this.customSearchBar = TextField(
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "YYYY-MM",
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          onSubmitted: (String str) {
                            print(today[0]);
                            today[0] = str;
                            print(today[0]);
                            Navigator.push(context,
                            SizeRoute(page: SearchMonthlyUserReport(searchName: searchName,searchMonth: str,))
                            );
                          });
                    } else {
                      this.cusIcon = Icon(Icons.search);
                      this.customSearchBar = Text("Monthly Report K4");
                    }
                  });
                },
              ),
            ],
            // actions: <Widget>[
            // ],
          ),
          body: MonthlyDataTableList(),
        ));
  }
}
