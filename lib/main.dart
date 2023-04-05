import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_project/login.dart';
import 'package:flutter_app_project/std_subjects.dart';
import 'package:get/get.dart';
import 'HomePage.dart';
import 'package:flutter_app_project/login_page.dart';
import 'package:flutter_app_project/otp_page.dart';
import 'dart:async';
import 'package:flutter_app_project/auth_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authcontroller = Authcontroller();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: authcontroller.AUTOLOGIN(),
          builder: (context, authResult) {
            if (authResult.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red));
            } else {
              if (authResult.data == true) {
                return HomePage();
              }
              return MyHomePage();
            }
          },
        ),
        routes: {
          '/HomePage': (context) => homePage(),
          '/myphone': (context) => Myphone(),
          '/myVerify': (context) => MyVerify(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Myphone()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 241, 173, 227),
            Color.fromARGB(255, 48, 22, 66),
          ],
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'To',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'EduTitans',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
