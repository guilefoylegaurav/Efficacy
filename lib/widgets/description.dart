import 'package:dsc_club_management_app/models/club.dart';
import 'package:dsc_club_management_app/utilities/utilities.dart';
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
    return Column(
      children: [
        Card(
          color: Color(hexColor(BG)),
          child: ListTile(
            title: Text(
              club.name,
              style: TextStyle(
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Wrap(
              spacing: 12,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.public,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                  icon: Icon(
                    MdiIcons.facebook,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Expanded(
            child: Container(
              child: Text(
                club.desc,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        )
      ],
    );
  }
}
