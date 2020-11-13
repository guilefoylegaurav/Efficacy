import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/event.dart';
import 'package:Efficacy/services/data.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/banner.dart';
import 'package:Efficacy/widgets/eventTile.dart';
import 'package:Efficacy/widgets/sidebar.dart';
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
