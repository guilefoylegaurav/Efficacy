import 'package:Efficacy/screens/clubs.dart';
import 'package:Efficacy/screens/feed.dart';
import 'package:flutter/material.dart';

import './login_screen.dart';

class Wrapper extends StatelessWidget {
  dynamic user = 1;
  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Login();
    } else {
      return Feed();
    }
  }
}
