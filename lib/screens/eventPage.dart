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
    final id = routeArgs['id'];
    final event= eventList.firstWhere((element) => element.id==id);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(hexColor(BG)),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Event Details"),

        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  child: InteractiveViewer(
                    constrained: false,
                      child: Image.network("https://images6.alphacoders.com/107/thumb-1920-1072679.jpg"),
                    ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.5,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.35,
                  left: 20.0,
                  right: 20.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(3.0,3.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.2
                        )
                      ]
                    ),
                    height: MediaQuery.of(context).size.height*0.45,
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            splashColor: Color(hexColor(BG)),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  children: [
                                    Text(
                                      event.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(hexColor(BG)),
                                        fontSize: 25.0
                                      )
                                    ),
                                    Divider(
                                      thickness: 2.5,
                                    ),
                                    Text(event.description, textAlign: TextAlign.justify,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: RaisedButton(
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              elevation: 20,
                              color: Color(hexColor(BG)),
                              child: Container(
                                child: Text('Interested', style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ),
                        ],
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
