import 'package:flutter/material.dart';

class QuickLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Quick Links"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Academic",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "MOODLE",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "INTERNSHIP LOGIN",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "PLACEMENT LOGIN",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Calendar",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "ACADEMIC CALENDAR",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "TIMETABLE",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "HOLIDAYS LIST",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Services",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "MICROSOFT STORE",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "LAUNDRY",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
