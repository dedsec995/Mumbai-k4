import 'package:flutter/material.dart';
import 'package:mum_k4/models/UsersList.dart';
import 'package:mum_k4/shared/Scale_Transtion.dart';
import 'package:provider/provider.dart';

import 'MonthlyReportTile.dart';
import 'MonthlyUserReport.dart';

class MonthlyReportList extends StatefulWidget {
  @override
  _MonthlyReportListState createState() => _MonthlyReportListState();
}

class _MonthlyReportListState extends State<MonthlyReportList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UsersList>>(context) ?? [];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            child: MonthlyReportTile(user: users[index]),
            onTap: () {
              // Scaffold.of(context)
              //     .showSnackBar(SnackBar(content: Text(index.toString())));
              Navigator.push(context,
                  ScaleRoute(page: MonthlyUserReport(users[index].name)));
              print(users[index].name);
            });
      },
    );
  }
}
