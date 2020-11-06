import 'package:dsc_club_management_app/config.dart';
import 'package:dsc_club_management_app/models/club.dart';
import 'package:dsc_club_management_app/models/event.dart';
import 'package:dsc_club_management_app/services/data.dart';
import 'package:dsc_club_management_app/utilities/utilities.dart';
import 'package:dsc_club_management_app/widgets/banner.dart';
import 'package:dsc_club_management_app/widgets/eventTile.dart';
import 'package:dsc_club_management_app/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Feed",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        drawer: Drawer(
          child: SideBar(
            clubList: clubList,
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
