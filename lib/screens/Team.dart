import 'package:Efficacy/config.dart';
import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarDemo();
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Mentors"),
              ),
              Tab(
                child: Text("Developers"),
              ),
              Tab(
                child: Text("Designers"),
              ),
            ],
          ),
          title: Text('About Us'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(fallbackURL_profile),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text('Tadas Petra'),
                      subtitle: Text('Here is a second line'),
                    ),
                  ),
                ),
              ],
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
