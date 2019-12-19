import 'package:flutter/material.dart';
import 'package:tabuada_show/Home.dart';
import 'package:tabuada_show/Tabuadas.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/tabuadas": (context) => Tabuadas(),
    },
    theme: ThemeData(fontFamily: "Bianca"),
    home: Home(),
  ));
}