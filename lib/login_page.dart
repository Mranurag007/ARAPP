import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project/otp_page.dart';
import 'package:flutter_app_project/main.dart';

class myphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myphone(),
    );
  }
}

class Myphone extends StatefulWidget {
  const Myphone({Key? key}) : super(key: key);
  static String verfiy = "";

  @override
  _MyphoneState createState() => _MyphoneState();
}

class _MyphoneState extends State<Myphone> {
  TextEditingController countryController = TextEditingController();
  var phone = "";

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/study.webp',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 300,
                child: Text(
                  "We need to register your phone without getting started!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 250,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(fontSize: 30),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) => phone = value,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "phone number",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                child: Container(
                  child: Text("Enter 10 digit Number",style: TextStyle(
                    color: Colors.red,
                  ),),
                ),
                visible: isVisible,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      if (phone.length != 10) {
                        setState(() {
                          isVisible =true;
                        });
                      } else {
                        setState(() {
                          isVisible =false;
                        });
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${countryController.text + phone}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {
                            print(e);
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            Myphone.verfiy = verificationId;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyVerify()));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
