import 'package:flutter/material.dart';
import 'package:Efficacy/models/event.dart';

class BannerS extends StatelessWidget {
  Event event;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/event");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          elevation: 5,
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/go.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "GoLang Workshop ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("by "),
                      Text(
                        "DSC",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "27 Sep | 21 : 00",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "ENDS IN 15 M",
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
