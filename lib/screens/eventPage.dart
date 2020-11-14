import 'package:Efficacy/config.dart';
import 'package:Efficacy/services/data.dart';
import 'package:Efficacy/utilities/utilities.dart';
import 'package:flutter/material.dart';


class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['e'];
    final event= eventList.firstWhere((element) => element.id==id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Event Details"),

        ),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                InteractiveViewer(
                  child: Image.asset("/assets/illuminitsl.png"),
                ),
                Positioned(
                  child: Container(
                    child: Card(
                      child: InkWell(
                        splashColor: Color(hexColor(BG)),
                        child: Container(
                          height: 100,
                          width: 300,
                          child: Text(event.description),
                        ),
                      ),
                    ),
                  ),
                )
            ],
            ),
          ),
        ),
      )
    );
  }
}
