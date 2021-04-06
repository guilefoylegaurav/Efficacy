import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/people.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Person> people = Provider.of<List<Person>>(context) ?? [];
    print(people);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: people.map((e) {
            return Container(
              width: 150,
              child: InkWell(
                onTap: () async {
                  if (e.fb.length == 0) {
                    launch(fallbackURLweb);
                  } else {
                    launch(e.fb);
                  }
                },
                child: Card(
                  child: Wrap(
                    children: [
                      Image.network(e.imageUrl.length == 0
                          ? fallbackURL_profile
                          : e.imageUrl),
                      ListTile(
                          title: Text(e.name,
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
