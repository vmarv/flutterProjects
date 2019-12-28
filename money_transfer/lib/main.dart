import 'package:flutter/material.dart';
import 'package:money_transfer/src/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Transfer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

