import 'dart:ui';
import './subject_items_Screen.dart';
import 'package:flutter/material.dart';

class Subject_Names extends StatelessWidget {
  final String subject_name;
  final String img_pth;
  Subject_Names(this.subject_name, this.img_pth);
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Subject_Items_Screen()));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 158, 158, 158),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              )
            ],
            image: DecorationImage(
              image: AssetImage(img_pth),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Color.fromARGB(255, 209, 209, 209).withOpacity(1.0),
                  BlendMode.darken),
            )),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Text(
            subject_name,
            style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 45.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.5, 2.5),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
