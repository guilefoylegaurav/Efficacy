import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/screens/eventScreen.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    Key key,
    @required this.club,
  }) : super(key: key);

  final Club club;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            club.name,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(MdiIcons.web, color: Colors.grey[400]),
            title: Text("Link"),
          ),
          Text(
            "About Club",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            club.desc,
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Color(hexColor(grayBG)),
            ),
          ),
          Text(
            "Discover More",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: FlatButton.icon(
                    icon: Icon(
                      MdiIcons.facebook,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await launchURL(club.fb);
                    },
                    label: Text(
                      "Follow",
                      style: TextStyle(
                          color: Colors.white,
                          // fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
