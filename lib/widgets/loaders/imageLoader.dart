import 'package:Efficacy/config.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      height: 150,
      child: Center(
        child: SpinKitWanderingCubes(
          color: Colors.blue[300],
          size: 50.0,
        ),
      ),
    );
  }
}
