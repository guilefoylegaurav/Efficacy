import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/event.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  Event e;
  EventTile({this.e});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("/event");
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 3,
          child: Column(
            children: [
              ListTile(
                trailing: Chip(
                  backgroundColor: Colors.green,
                  label: Text(
                    "Completed",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                leading: CircleAvatar(
                  child: Text("A"),
                ),
                title: Text(
                  e.name,
                  style:
                      TextStyle(fontFamily: font, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("description"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(e.date)],
                ),
              )
            ],
          ),
        ));
  }
}
