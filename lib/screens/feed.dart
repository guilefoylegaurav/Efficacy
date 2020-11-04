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
              Container(
                  child: Column(
                children: clubList.map((e) {
                  return ListTile(
                      title: Text(e.name),
                      onTap: () {
                        Navigator.of(context).pushNamed("/oneClub", arguments: {
                          "id": e.id,
                        });
                      });
                }).toList(),
              ))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannerS(),
              Container(
                child: Column(
                  children: eventList.map((e) {
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
