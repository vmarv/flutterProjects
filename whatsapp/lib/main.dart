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



