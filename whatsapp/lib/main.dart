import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Home.dart';
import 'package:whatsapp/Login.dart';


void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075e54),
      accentColor: Color(0xff25d366)
    ),
  ));
}



