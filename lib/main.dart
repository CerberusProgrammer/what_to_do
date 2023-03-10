import 'package:flutter/material.dart';
import 'package:what_to_do/home.dart';
import 'package:what_to_do/my_custom_scroll_behavior.dart';

void main() {
  runApp(MaterialApp(
    scrollBehavior: MyCustomScrollBehavior(),
    debugShowCheckedModeBanner: false,
    title: 'What to do?',
    theme: ThemeData.dark(
      useMaterial3: true,
    ),
    home: const Home(),
  ));
}
