import 'package:brewcrew/models/user.dart';
import 'package:brewcrew/screen/authenticate/authenticate.dart';
import 'package:brewcrew/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either Home or Authenticate widget
    return Authenticate();
  }
}
