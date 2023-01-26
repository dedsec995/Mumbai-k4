import 'package:flutter/material.dart';
import 'package:mum_k4/screens/user/admin/report/Daily_Report/reporttile.dart';
import 'package:provider/provider.dart';
import 'package:mum_k4/models/aahnik.dart';


class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    
    final aahniks = Provider.of<List<Aahnik>>(context) ?? [];
    
    return ListView.builder(
      itemCount: aahniks.length,
      itemBuilder: (context, index){
        return ReportTile(aahnik: aahniks[index]);
      },
      );
  }
}
 