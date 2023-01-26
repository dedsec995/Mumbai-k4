import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:mum_k4/models/aahnik.dart';

class AahnikTile extends StatelessWidget {
  final Aahnik aahnik;
  AahnikTile({this.aahnik});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
          color: Colors.orange[50],
          ),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text("${aahnik.date}"),
            children: <Widget>[
              ListTile(
                // leading: CircleAvatar(radius: 25.0,),
                // title: Text(aahnik.date),
                subtitle: Text(
                    " Aarti: ${aahnik.aarti}\n Mansi: ${aahnik.mansi}\n Nitya: ${aahnik.nityap}\n Vanchan: ${aahnik.vanchan}\n Chesta: ${aahnik.chesta}\n Gharsabha: ${aahnik.gharsabha}\n Jivan Charitra: ${aahnik.jivan} "),
                isThreeLine: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
