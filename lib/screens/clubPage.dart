import 'package:dsc_club_management_app/config.dart';
import 'package:dsc_club_management_app/widgets/eventTile.dart';
import 'package:flutter/material.dart';
import '../utilities/utilities.dart';
import '../services/data.dart';

class ClubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    var club = clubList.firstWhere((element) => element.id == id);
    var events = eventList.where((element) => element.club == club.name);
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
                  club.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                background: Stack(
                  children: [
                    Container(
                      child: Image.network(
                        "https://lh3.googleusercontent.com/proxy/dvv3PVmRr-U82XIbhzrfJt57vBgAtE7uk1y8wye3dbhWgt-l9lnJjyKDR33uvdjRMi6wPnhqP9N4QpXcLLyfkkLKn65TBuPOwfI9AUGEGK6EW24kvNyO54Aj1xzpgTijSfLy9pr0Ip-5g-NA1P3Nrprz0qzSvT2iYqXV",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.white),
                        height: 600,
                      ),
                    )
                  ],
                )),
            expandedHeight: 200,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: events.map((e) => EventTile(e: e)).toList(),
                    ),
                  )
                ]),
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
