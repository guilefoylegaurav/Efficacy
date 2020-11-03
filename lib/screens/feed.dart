import 'package:dsc_club_management_app/models/event.dart';
import 'package:dsc_club_management_app/services/data.dart';
import 'package:dsc_club_management_app/widgets/banner.dart';
import 'package:dsc_club_management_app/widgets/eventTile.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Feed",
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Illuminits'),
                onTap: () {
                  Navigator.of(context).pushNamed("/oneClub");
                },
              ),
              ListTile(
                title: Text('Machine Learning Club'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannerS(),
              Container(
                child: Column(
                  children: EventList.map((e) {
                    return EventTile(
                      e: e,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
