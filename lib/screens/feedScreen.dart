import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/event.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/services/data.dart';
import 'package:Efficacy/services/database.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/tile.dart';
// import 'package:Efficacy/widgets/eventTile.dart';
import 'package:Efficacy/widgets/loaders/loader.dart';
import 'package:Efficacy/widgets/sabt.dart';
import 'package:Efficacy/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    List<EventCloud> events = Provider.of<List<EventCloud>>(context);
    List<Club> clubs = Provider.of<List<Club>>(context);
    if (events == null || clubs == null) {
      return Scaffold(
        body: Loader(),
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.menu),
          title: Text(
            "Feed",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Feed",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            elevation: 0,
          ),
          drawer: Drawer(
            child: SideBar(
              clubList: clubs,
            ),
          ),
          body: ListView.builder(
            itemBuilder: (c, i) {
              return EventTile(
                event: events[i],
              );
            },
            itemCount: events.length,
          ));
    }
  }
}
