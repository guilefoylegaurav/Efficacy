import 'dart:io';

import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/services/database.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/line.dart';

import 'package:Efficacy/widgets/loaders/loader.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final eventId = routeArgs['id'];

    return StreamProvider.value(
      value: DatabaseService(id: eventId).fetchEvent,
      child: EventDescription(),
    );
  }
}

class EventDescription extends StatefulWidget {
  @override
  _EventDescriptionState createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  @override
  Widget build(BuildContext context) {
    EventCloud event = Provider.of<EventCloud>(context);
    if (event == null) {
      return Scaffold(
        body: Loader(),
      );
    } else {
      return StreamProvider.value(
        value: DatabaseService(id: event.clubId).fetchClub,
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
              // icon: Icon(MdiIcons.pin),
              label: Text("Interested"),
              onPressed: () {}),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                pinned: true,
                // title: Text(event.title),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  event.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                    child: Text(
                      event.title,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text(DateFormat.yMMMEd().format(event.startTime)),
                    subtitle: Text(DateFormat.jm().format(event.startTime)),
                    leading: Icon(Icons.calendar_today),
                  ),
                  ListTile(
                    title: Text("Venue"),
                    leading: Icon(
                      Icons.location_on,
                    ),
                  ),
                  Line(L: 50, R: 50, T: 40, B: 40),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
                    child: Text(
                      "About",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
                    child: Text(
                      event.about.replaceAll('/n', '\n'),
                    ),
                  ),
                  Line(L: 50, R: 50, T: 35, B: 50),
                  Row(
                    children: [
                      ClubFacebook(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: FlatButton(
                      color: Color(hexColor(BG)),
                      onPressed: () async {
                        await launchURL(
                            "https://www.facebook.com/Illuminits/photos/a.123550321173027/1483665005161545/");
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      );
    }
  }
}

class ClubFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Club c = Provider.of<Club>(context) ??
        Club(
            id: "unavailable",
            imageUrl: "unavailable",
            name: "unavailable",
            desc: "unavailable",
            fb: "unavailable");

    return Expanded(
        child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/oneClub", arguments: {"id": c.id});
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(c.imageUrl), fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          c.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton.icon(
          icon: Icon(
            MdiIcons.facebook,
            color: Colors.white,
          ),
          onPressed: () async {
            await launchURL(c.fb);
          },
          label: Text(
            "Follow",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Colors.blue,
        ),
        SizedBox(
          height: 30,
        )
      ],
    ));
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
