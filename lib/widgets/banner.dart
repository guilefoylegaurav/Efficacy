import 'package:flutter/material.dart';

class BannerS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/event");
      },
      child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/hack.jpg'),
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
                    "Hacktoberfest Workshop ",
                    style: TextStyle(fontSize: 20),
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
    );
  }
}
