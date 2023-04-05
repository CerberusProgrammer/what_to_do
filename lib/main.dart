import 'package:flutter/material.dart';
import 'package:what_to_do/data/activities.dart';
import 'package:what_to_do/home.dart';
import 'package:what_to_do/custom/my_custom_scroll_behavior.dart';

import 'object/user.dart';

void main() {
  User.user.add(User());

  runApp(MaterialApp(
    scrollBehavior: MyCustomScrollBehavior(),
    debugShowCheckedModeBanner: false,
    title: 'What to do?',
    theme: ThemeData(
      colorSchemeSeed: Colors.blueGrey,
      useMaterial3: true,
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      colorSchemeSeed: Colors.blueGrey,
      useMaterial3: true,
      brightness: Brightness.dark,
    ),
    home: const Home(),
  ));
}
