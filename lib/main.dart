import 'package:flutter/material.dart';
import 'package:flutter_examp2/Add_Contact.dart';
import 'package:flutter_examp2/Home_Screen.dart';
import 'package:flutter_examp2/View_Screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomeScreen(),
        'Add':(context) => AddContact(),
        'view':(context) => ViewScreen(),
      },
    ),
  );
}
