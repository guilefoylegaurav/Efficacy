import 'package:dsc_club_management_app/services/data.dart';
import 'package:dsc_club_management_app/widgets/banner.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
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
                  Navigator.of(context).pushNamed("/illuminits");
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
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/event");
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/code.png"))),
                          ),
                        ),
                        title: Text(e.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Organised by ${e.club}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${e.date} | ${e.time}"),
                                Text(
                                  "ENDED",
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
