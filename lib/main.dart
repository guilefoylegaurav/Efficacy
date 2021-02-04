import 'package:Efficacy/screens/clubPage.dart';
import 'package:Efficacy/screens/eventScreen.dart';
import 'package:Efficacy/screens/feedScreen.dart';
import 'package:overlay_support/overlay_support.dart';
import './screens/profile.dart';
import './screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './screens/clubs.dart';
import './screens/register_screen.dart';
import './screens/clubPage.dart';
import './config.dart';
import './utilities/utilities.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(OverlaySupport(child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((value) => print("token" + value));
    _firebaseMessaging.subscribeToTopic('active');
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      // print("onMessage: $message");
      showOverlayNotification((context) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: SafeArea(
            child: ListTile(
              onTap: () {
                print("onMessage event id" + message["data"]["id"].toString());
                navigatorKey.currentState.pushNamed("/event",
                    arguments: {"id": message["data"]["id"].toString()});
              },
              leading: CircleAvatar(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/efficacy_logo.jpg"),
              )),
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
              trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    OverlaySupportEntry.of(context).dismiss();
                  }),
            ),
          ),
        );
      }, duration: Duration(milliseconds: 4000));

      print(message['notification']['title']);
    }, onResume: (message) async {
      print(message["data"]["click_action"]);
      print("Data ID" +
          message["data"]["id"] +
          "type" +
          (message["data"]["id"] is String).toString());
      navigatorKey.currentState.pushNamed("/event",
          arguments: {"id": message["data"]["id"].toString()});
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
      print(message["data"]["id"]);
      navigatorKey.currentState.pushReplacementNamed("/");
      navigatorKey.currentState.pushNamed("/event",
          arguments: {"id": message["data"]["id"].toString()});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(),
        backgroundColor: Colors.white,
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(),
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
