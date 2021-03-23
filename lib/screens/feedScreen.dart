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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:provider/provider.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    PaginateRefreshedChangeListener refreshChangeListener =
        PaginateRefreshedChangeListener();

    // List<EventCloud> events = Provider.of<List<EventCloud>>(context);
    List<Club> clubs = Provider.of<List<Club>>(context) ?? [];
    // if (events == null || clubs == null) {
    //   return Scaffold(
    //     body: Loader(),
    //     appBar: AppBar(
    //       elevation: 0,
    //       leading: Icon(Icons.menu),
    //       title: Text(
    //         "Feed",
    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    //       ),
    //     ),
    //   );
    // } else {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
        // body: ListView.builder(
        //   itemBuilder: (c, i) {
        //     return EventTile(
        //       event: events[i],
        //     );
        //   },
        //   itemCount: events.length,
        // )
        body: RefreshIndicator(
          onRefresh: () async {
            refreshChangeListener.refreshed = true;
          },
          child: PaginateFirestore(
            itemBuilder: (index, context, snapshot) {
              EventCloud e = EventCloud(
                id: snapshot.documentID ??
                    'NULL ID DATABASE SERVICE EVENTCLOUD',
                title: snapshot.data()["title"] ?? 'event title',
                startTime:
                    snapshot.data()["startTime"].toDate() ?? DateTime.now(),
                imageUrl: snapshot.data()["imageUrl"] ?? 'picture url',
                googleFormLink: snapshot.data()["googleFormLink"] ?? '',
                fbPostLink: snapshot.data()["fbPostLink"] ?? '',
                endTime: snapshot.data()["endTime"].toDate() ?? DateTime.now(),
                clubId: snapshot.data()["clubId"] ?? 'clubid',
                clubName: snapshot.data()["clubName"] ?? 'clubname',
                about: snapshot.data()["about"] ?? 'about',
                duration: snapshot
                        .data()["endTime"]
                        .toDate()
                        .difference(snapshot.data()["startTime"].toDate())
                        .inHours ??
                    "",
              );

              return EventTile(
                event: e,
              );
            },
            query: FirebaseFirestore.instance.collection('events'),
            listeners: [
              refreshChangeListener,
            ],
            itemBuilderType: PaginateBuilderType.listView,
          ),
        ));
  }
}
// }
