import 'package:flutter/material.dart';

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
                  background: Image(
                    image: AssetImage('assets/illuminitsl.png'),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ];
        },
        body: Column(
          children: [
            DefaultTabController(
              length: 2,
              child:  TabBar(
                tabs: [
                  Tab(child:(
                      Text(
                        "Club Details",
                        style: TextStyle(color: Colors.blue),
                      )
                  )),
                  Tab(child:(
                      Text(
                        "Events",
                        style: TextStyle(color: Colors.blue),
                      )
                  )),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}