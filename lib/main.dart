import 'package:flutter/material.dart';
import 'package:what_to_do/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'What to do?',
    theme: ThemeData.dark(
      useMaterial3: true,
    ),
    home: const Home(),
  ));
}
