import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/services/data.dart';
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
    var availableClubs = clubList.where((element) {
      return club.name != element.name;
    });
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
            "About Us",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(club.desc),
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
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: availableClubs.map((e) {
                return Container(
                  width: 200,
                  child: InkWell(
                    onTap: () => {
                      Navigator.of(context).pushReplacementNamed("/oneClub",
                          arguments: {"id": e.id})
                    },
                    child: Card(
                      elevation: 5.0,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Wrap(
                        children: [
                          Image.asset(
                            e.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          ListTile(
                            title: Text(e.name),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: clubList
          //         .map((e) => Card(
          //               child: Text(e.name),
          //             ))
          //         .toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
