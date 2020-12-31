import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/widgets/loaders/imageLoader.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  EventCloud event;
  EventTile({this.event});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/event", arguments: {"id": event.id});
      },
      child: ClipRRect(
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  ImageLoader(),
                  Image.network(
                    event.picture,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ]),
                Padding(
                  //Date
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    DateFormat.yMMMEd().format(event.timings) +
                        '|' +
                        DateFormat.jm().format(event.timings),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: "CenturyGothic"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text(
                    event.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event.clubName,
                        style: TextStyle(fontSize: 15, color: Colors.deepOrangeAccent),
                      ),
                      // Container(
                      //     child: Wrap(
                      //   children: [
                      //     IconButton(
                      //         icon: Icon(Icons.share), onPressed: () => {}),
                      //     IconButton(
                      //         icon: Icon(Icons.favorite_border),
                      //         onPressed: () => {})
                      //   ],
                      // )),
                    ],
                  ),
                ),
                Divider(height: 20.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
