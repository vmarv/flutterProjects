import 'package:flutter/material.dart';
import 'package:meu_caixa/telas/Home.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Colors.purple
);

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Meu caixa",
  theme: temaPadrao,
  home: Home(),
));