import 'package:Efficacy/config.dart';
import 'package:Efficacy/widgets/eventTile.dart';
import 'package:flutter/material.dart';
import '../utilities/utilities.dart';
import '../services/data.dart';

class Illuminits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Illuminits",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                      )),
                  background: Container(
                    color: Color(hexColor(BG)),
                  ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 5),
              child: Column(
                children: [
                  DefaultTabController(
                    length: 2,
                    child:  TabBar(
                      tabs: [
                        Tab(child:(
                            Text(
                              "Club Details",
                              style: TextStyle(fontFamily: font, fontWeight: FontWeight.bold,color: Colors.teal),
                            )
                        )),
                        Tab(child:(
                            Text(
                              "Events",
                              style: TextStyle(fontFamily: font, fontWeight: FontWeight.bold, color: Colors.teal),
                            )
                        )),
                      ],
                    ),
                  ),
                  Column(
                    children: EventList.map((e) => EventTile(e: e)).toList(),
                  ),
                ],
              ),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              height: 600,
            )
          ],
        )
      ),
    );
  }
}