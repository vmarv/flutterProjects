import 'package:flutter/material.dart';
import 'telas/Home.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
  theme: ThemeData(
    primaryColor: Color(0xff795548),
    //accentColor: Colors.white
    scaffoldBackgroundColor: Color(0xfff5e9b9)
  ),
));

