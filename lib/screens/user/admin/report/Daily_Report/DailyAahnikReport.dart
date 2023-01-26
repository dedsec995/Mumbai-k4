import 'package:flutter/material.dart';
import 'package:mum_k4/models/aahnik.dart';
import 'package:mum_k4/screens/user/admin/report/Daily_Report/report_list.dart';
import 'package:mum_k4/screens/user/admin/report/Daily_Report/SearchDateReport.dart';
import 'package:mum_k4/shared/Slide_Right_Transition.dart';
import 'package:mum_k4/services/database.dart';
import 'package:provider/provider.dart';

class DailyAahnikReport extends StatefulWidget {
  @override
  _DailyAahnikReportState createState() => _DailyAahnikReportState();
}

class _DailyAahnikReportState extends State<DailyAahnikReport> {
  var day;
  var prevday;
  var today;
  String searchDate = '';
  Icon cusIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Aahnik Report K4");
  @override
  Widget build(BuildContext context) {
    day = new DateTime.now();
    prevday = new DateTime(day.year, day.month, day.day - 1);
    if (day.hour < 12) {
      today = prevday.toString().split(" ");
      print(today);
    } else {
      today = day.toString().split(" ");
      print(today);
    }
    return StreamProvider<List<Aahnik>>.value(
        value: DatabaseService(day: today[0]).report,
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/red_blue_back.png"),
          //     fit: BoxFit.cover,
          //     // alignment: Alignment.bottomLeft,
          //   ),
          // ),
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
                              hintText: "YYYY-MM-DD",
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
                                  SlideRightRoute(page: SearchDateReport(str)));
                            });
                      } else {
                        this.cusIcon = Icon(Icons.search);
                        this.customSearchBar = Text("Aahnik Report K4");
                      }
                    });
                  },
                ),
              ],
              // actions: <Widget>[
              // ],
            ),
            body: ReportList(),
          ),
        ));
  }
}
