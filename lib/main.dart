import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/data/constants.dart';
import 'package:what_to_do/data/data.dart';
import 'package:what_to_do/home.dart';
import 'package:what_to_do/custom/my_custom_scroll_behavior.dart';

import 'object/user.dart';

void main() {
  runApp(const Main());

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
      return db.execute("""
      CREATE TABLE $userTable(
      key INTEGER PRIMARY KEY DEFAULT 1 NOT NULL,
      name TEXT,
      completed INTEGER,
      accepted INTEGER,
      education INTEGER,
      recreational INTEGER,
      social INTEGER,
      diy INTEGER,
      charity INTEGER,
      cooking INTEGER,
      relaxation INTEGER,
      music INTEGER,
      busywork INTEGER,
      image INTEGER)
              """);
    },
    version: 1,
  ).then((database) {
    Data.getUsers(database).then((value) {
      listUser = value;
      if (listUser.isNotEmpty) {
        User.mainUser = listUser[0];
      } else {
        Data.insertUser(database, User(), 'users');
      }
    });
  });
}

final GlobalKey<MainState> myAppKey = GlobalKey<MainState>();

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<StatefulWidget> {
  List<Color> colors = [
    Colors.amber,
    Colors.red,
    Colors.teal,
    Colors.blueGrey,
    Colors.pink,
    Colors.purple,
  ];

  int i = 5;

  void change(int index) {
    setState(() {
      i = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: myAppKey,
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'What to do?',
        theme: ThemeData(
          colorSchemeSeed: colors[i],
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        home: const Home());
  }
}
