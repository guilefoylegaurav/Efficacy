import 'package:Efficacy/config.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFadingCircle(
          color: Color(hexColor(BG)),
          size: 50.0,
        ),
      ),
    );
  }
}
