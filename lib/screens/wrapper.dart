import 'package:dsc_club_management_app/screens/clubs.dart';
import 'package:dsc_club_management_app/screens/feed.dart';
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
