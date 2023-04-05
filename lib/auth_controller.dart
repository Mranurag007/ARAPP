import 'dart:convert';
import 'package:flutter_app_project/HomePage.dart';
import 'package:flutter_app_project/login.dart';
import 'package:flutter_app_project/login_page.dart';
import 'package:flutter_app_project/otp_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcontroller {
  static login(String ver_ID) async {
    print(ver_ID);
    var responce = {"id": "1234"};
    var any_instance = await SharedPreferences.getInstance();
    any_instance.setString("USERID", jsonEncode(responce));
    Get.off(homePage());
  }

  Future<bool> AUTOLOGIN() async {
    var any_instance = await SharedPreferences.getInstance();
    if (!any_instance.containsKey("USERID")) {
      return false;
    } else {
      return true;
    }
  }

  static logout() async {
    var any_instance = await SharedPreferences.getInstance();
    any_instance.clear();
    Get.off(myphone());
  }
}
