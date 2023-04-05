import 'package:flutter/material.dart';
import 'package:what_to_do/home.dart';
import 'package:what_to_do/custom/my_custom_scroll_behavior.dart';

import 'data/data.dart';

void main() {
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
      colorSchemeSeed: Colors.amber,
      useMaterial3: true,
      brightness: Brightness.dark,
    ),
    home: const Home(),
  ));
}
