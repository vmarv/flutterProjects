import 'package:flutter/material.dart';
import 'package:uber/Rotas.dart';
import 'package:uber/telas/Home.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xff37474f),
  accentColor: Color(0xff546e7a)
);

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Uber",
  home: Home(),
  theme: temaPadrao,
  initialRoute: "/",
  onGenerateRoute: Rotas.gerarRotas,
));

