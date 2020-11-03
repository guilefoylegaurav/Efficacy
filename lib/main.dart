import 'package:dsc_club_management_app/screens/clubPage.dart';
import 'package:dsc_club_management_app/screens/eventPage.dart';

import './screens/profile.dart';
import './screens/wrapper.dart';
import 'package:flutter/material.dart';

import './screens/clubs.dart';
import './screens/register_screen.dart';
import './screens/clubPage.dart';
import './config.dart';
import './utilities/utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: "CenturyGothic"),
          bodyText2: TextStyle(fontFamily: "CenturyGothic"),
        ),
        backgroundColor: Color(hexColor(BG)),
        primaryColor: Color(hexColor(BG)),
        primaryTextTheme: TextTheme(
          headline6:
              TextStyle(color: Colors.white, fontFamily: "CenturyGothic"),
        ),
      ),
      routes: {
        "/": (context) => Wrapper(),
        "/register": (context) => Register(),
        "/clubs": (context) => Clubs(),
        "/profile": (context) => Profile(),
        "/event": (context) => EventPage(),
        "/oneClub": (context) => ClubPage(),
      },
    );
  }
}
