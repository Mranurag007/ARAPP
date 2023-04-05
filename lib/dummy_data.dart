import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './models/category.dart';
import './models/subjects.dart';
import 'dart:core';

const Dummy_Categories = const [
  Category(stdno: '1', ImgPath: 'assets/images/girlprofile.webp'),
  Category(stdno: '2', ImgPath: 'assets/images/girlprofile.webp'),
  Category(stdno: '3', ImgPath: 'assets/images/girlprofile.webp'),
  Category(stdno: '4', ImgPath: 'assets/images/girlprofile.webp')
];
//
// class databasemanger {
//   final CollectionReference catlist =
//       FirebaseFirestore.instance.collection('CATEGORIES');
//
//   Future getUserLIst() async {
//     List catList = [];
//     try {
//       await catlist.get().then((querySnapshot) {
//         querySnapshot.docs.forEach((element) {
//           catList.add(element.data);
//           print(catList.length);
//         });
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
