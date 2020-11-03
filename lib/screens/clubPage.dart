import 'package:dsc_club_management_app/config.dart';
import 'package:dsc_club_management_app/widgets/eventTile.dart';
import 'package:flutter/material.dart';
import '../utilities/utilities.dart';
import '../services/data.dart';

class ClubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor(BG)),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Illuminits",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                color: Color(hexColor(BG)),
              ),
            ),
            expandedHeight: 200,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 5),
              child: Column(
                children: EventList.map((e) => EventTile(e: e)).toList(),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              height: 600,
            )
          ]))
        ],
      ),
    );
  }
}
