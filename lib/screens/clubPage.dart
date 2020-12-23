import 'package:Efficacy/config.dart';
import 'package:Efficacy/services/data.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/description.dart';
// import 'package:Efficacy/widgets/eventTile.dart';
import 'package:Efficacy/widgets/sabt.dart';
import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final club = clubList.firstWhere((element) => element.id == id);
    final event = eventList.where((element) => element.club == club.name);
    return Container(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.black),
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                          club.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        centerTitle: true,
                        title: SABT(
                            child: Text(
                          club.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0)),
                            color: Colors.white),
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 1.0),
                        labelColor: Color(hexColor(BG)),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(child: Icon(Icons.event)),
                          Tab(
                            child: Icon(Icons.info),
                          ),
                        ],
                      ),
                    ),
                    floating: true,
                  ),
                ];
              },
              body: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                        //   children: event
                        //       .map((e) => EventTile(
                        //             e: e,
                        //           ))
                        //       .toList(),
                        ),
                  ),
                  SingleChildScrollView(child: DescriptionSection(club: club)),
                ]),
              )),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(hexColor(BG)),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
