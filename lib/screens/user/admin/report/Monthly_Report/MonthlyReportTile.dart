import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:mum_k4/models/UsersList.dart';

class MonthlyReportTile extends StatelessWidget {
  final UsersList user;
  MonthlyReportTile({this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: GradientColors.facebookMessenger),
          ),
          child: ListTile(
            title: Text("${user.name}"),
          ),
        ),
      ),
    );
  }
}
