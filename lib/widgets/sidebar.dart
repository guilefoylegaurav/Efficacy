import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  List<Club> clubList;
  SideBar({this.clubList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: ListTile(
            leading: CircleAvatar(
              child: Text("A"),
            ),
            title: Text(
              "Guest",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("NITS Student"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ExpansionTile(
          title: Text(
            "Clubs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.people),
          children: clubList.map((e) {
            return ListTile(
                title: Text(
                  e.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("/oneClub", arguments: {
                    "id": e.id,
                  });
                });
          }).toList(),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        // Container(
        //     child: Column(
        //   children:
        // ))
      ],
    );
  }
}
