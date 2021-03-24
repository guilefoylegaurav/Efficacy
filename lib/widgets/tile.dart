import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/screens/eventScreen.dart';
import 'package:Efficacy/services/data.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:Efficacy/widgets/loaders/imageLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Efficacy/models/event.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  EventCloud event;
  EventTile({this.event});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Event Id" + event.id);
        Navigator.of(context).pushNamed("/event", arguments: {"id": event.id});
      },
      child: ClipRRect(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  ImageLoader(),
                  Container(

                    constraints: BoxConstraints(maxHeight: 200),
                    child: Image.network(
                      event.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                            child: Flexible(
                              child: Text(
                                event.title,
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),

                            child:
                                  Flexible(
                                    child:
                                      Text(
                                        event.clubName,
                                        style: TextStyle(fontSize: 20, color: Colors.grey),
                                        textAlign: TextAlign.center,
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

                                  ),


                          ),],),
                    ),
                    Padding(
                      //Date
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Expanded(
                        child: Column(
                          children: [
                            RaisedButton(
                              // padding: EdgeInsets.symmetric(horizontal: 100.0),
                              child: Flexible(child: new Text("Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                              ),
                              color: Colors.blueAccent,
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed:() {
                                Navigator.of(context).pushNamed("/event", arguments: {"id": event.id});
                              },

                            ),
                            Text(
                              "startTime",

                              // DateFormat.jm().format(event.startTime),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMEd().format(event.startTime) ,

                              // DateFormat.jm().format(event.startTime),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              // DateFormat.yMMMEd().format(event.startTime) ,

                              DateFormat.jm().format(event.startTime),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.1,)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
