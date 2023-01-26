import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:mum_k4/screens/user/shared/aahnik_add_page.dart';
import 'package:mum_k4/shared/Rotation_Transition.dart';
import 'package:mum_k4/shared/Size_Transition.dart';

class AddAahnikDate extends StatefulWidget {
  @override
  _AddAahnikDateState createState() => _AddAahnikDateState();
}

class _AddAahnikDateState extends State<AddAahnikDate> {
  var day;

  var prevday;

  var today;

  var name;

  bool pressAttention = false;

  var percent;

  var montharray;

  String month;

  String monthstring;

  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/time.jpg"),
            fit: BoxFit.cover,
            // alignment: Alignment.bottomLeft,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 60,
            width: 200,
            child: RaisedButton(
              onPressed: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2022))
                  .then((date) {
                setState(() {
                  _dateTime = date;
                  today = _dateTime.toString().split(" ");
                  Navigator.push(context, SizeRoute(page: Addaahnikdata(today[0])));
                });    
              }),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: GradientColors.sunrise),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 60.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Select Date',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
