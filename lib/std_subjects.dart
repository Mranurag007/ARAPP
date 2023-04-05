import 'package:flutter/material.dart';
import './subject_names.dart';
import 'package:flutter_app_project/dummy_data.dart';
class std_Subjects extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 54, 207, 161),
            elevation: 3.0,
            toolbarHeight: 70.0,
            title: Container(
              child: Text(
                'Subjects',
                style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: <Widget>[
                  Subject_Names('Trees', 'assets/images/Trees.jpg'),
                  Subject_Names('Animals', 'assets/images/Animals.jpg'),
                  Subject_Names('Birds', 'assets/images/birds.png')
                ],
              ),
            )));
  }
}
