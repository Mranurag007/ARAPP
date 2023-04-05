import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_project/drawer_left.dart';
import './dummy_data.dart';
import './cat_standard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var img;
  var ind;

  Future getData() async {
    await FirebaseDatabase.instance
        .reference()
        .child('std1')
        .once()
        .then((value) {
      if (value.snapshot.value != null) {
        Map<dynamic, dynamic> m = value.snapshot.value as Map;
        setState(() {
          img = m['catimgpath'];
          ind = m['catindex'];
        });
      }
      print(img + ind);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // fetchdata();
    super.initState();
    getData();
  }

  //
  // fetchdata() async {
  //   dynamic result = await databasemanger().getUserLIst();
  //   if (result == null) {
  //     print("UNABLE TO RETRIEVE DATA");
  //   } else {
  //     setState(() {
  //       USER_data = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: app_drawer(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 40),
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 90.0,
          title: Container(
            margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37.5),
                      image: DecorationImage(
                          image: AssetImage('assets/images/girlprofile.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              )
            ]),
          )),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
              color: Colors.white,
              height: 200.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 15.0)),
                            Stack(
                              children: <Widget>[
                                Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 30)),
                                    Text('Explore,',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 67, 18, 85))),
                                    Text('Enjoy,',
                                        style: TextStyle(
                                          fontSize: 25,
                                        )),
                                    Text('and Learn',
                                        style: TextStyle(
                                          fontSize: 30,
                                        ))
                                  ],
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          height: 200.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/study.webp'),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 31, 42, 132),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Category_std(ind, img);
                  }),
            )
          ])),
    );
  }
}
