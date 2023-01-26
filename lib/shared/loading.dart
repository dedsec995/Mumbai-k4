import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[900],
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset('assets/loader.json'),
          ),
        ));
  }
}
