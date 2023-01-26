import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:mum_k4/models/aahnik.dart';

class ReportTile extends StatelessWidget {
  final Aahnik aahnik;
  ReportTile({this.aahnik});
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
                    colors: GradientColors.skyLine),
          ),
          child: ExpansionTile(
            title: Text("${aahnik.date}"),
            children: <Widget>[
              ListTile(
                    // leading: CircleAvatar(radius: 25.0,),
                    // title: Text("${aahnik.name}                                   ${aahnik.date}"),
                    subtitle: Text(
                        "Aarti: ${aahnik.aarti} Mansi: ${aahnik.mansi} Nitya: ${aahnik.nityap} Vanchan: ${aahnik.vanchan} Chesta: ${aahnik.chesta}  Gharsabha: ${aahnik.gharsabha} Jivan Charitra: ${aahnik.jivan} "),
                    // isThreeLine: true,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}