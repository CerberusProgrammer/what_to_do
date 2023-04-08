import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/data/constants.dart';
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
      colorSchemeSeed: Colors.purple,
      useMaterial3: true,
      brightness: Brightness.dark,
    ),
    home: const Home(),
  ));

  openDatabase(
    activityDatabase,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $activityTable(id INTEGER PRIMARY KEY, activity TEXT, type TEXT, participants INTEGER, price REAL, link TEXT, key TEXT, accessibility REAL, isCompleted INTEGER)',
      );
    },
    version: 1,
  ).then((database) {
    Data.getActivities(database).then((value) {
      listActivity = value;
      User.mainUser.accepted = listActivity.length;
    });
  });

  openDatabase(
    userDatabase,
    onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $userTable(key INTEGER PRIMARY KEY, name TEXT, completed INTEGER, accepted INTEGER, education INTEGER, recreational INTEGER, social INTEGER, diy INTEGER, charity INTEGER, cooking INTEGER, relaxation INTEGER, music INTEGER, busywork INTEGER, image INTEGER)");
    },
    version: 1,
  ).then((database) {
    Data.getUsers(database).then((value) {
      listUser = value;
      print(listUser);
      if (listUser.isNotEmpty) {
        User.mainUser = listUser[0];
      } else {
        Data.insertUser(database, User(), 'users');
      }
    });
  });
}
