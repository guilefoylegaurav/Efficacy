import 'package:Efficacy/screens/clubPage.dart';
import 'package:Efficacy/screens/eventScreen.dart';

import './screens/profile.dart';
import './screens/wrapper.dart';
import 'package:flutter/material.dart';

import './screens/clubs.dart';
import './screens/register_screen.dart';
import './screens/clubPage.dart';
import './config.dart';
import './utilities/utilities.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        backgroundColor: Colors.white,
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(fontFamily: font, fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        "/": (context) => Wrapper(),
        "/register": (context) => Register(),
        "/clubs": (context) => Clubs(),
        "/profile": (context) => Profile(),
        "/event": (context) => EventScreen(),
        "/oneClub": (context) => ClubPage(),
      },
    );
  }
}
