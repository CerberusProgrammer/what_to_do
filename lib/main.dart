import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/data/data.dart';
import 'package:what_to_do/home.dart';
import 'package:what_to_do/custom/my_custom_scroll_behavior.dart';

import 'object/user.dart';

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

  openDatabase(
    'wtd.db',
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE activities(id INTEGER PRIMARY KEY, activity TEXT, type TEXT, participants INTEGER, price REAL, link TEXT, key TEXT, accessibility REAL, isCompleted INTEGER)',
      );
    },
    version: 1,
  ).then((database) {
    Data.getActivities(database).then((value) {
      listActivity = value;
      User.mainUser.acceptedTasks = listActivity.length;
    });
  });
}
