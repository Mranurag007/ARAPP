import 'package:flutter/material.dart';
import './subject_items.dart';

class Subject_Items_Screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal[400],
          elevation: 3.0,
          toolbarHeight: 70.0,
          title: Container(
            child: Text(
              'Subject Name',
              style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )),
      body: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Subject_Items('assets/images/pine.webp', 'Pine'),
            Subject_Items('assets/images/Trees.jpg', 'Pine'),
          ],
        ),
      ),
    );
  }
}
