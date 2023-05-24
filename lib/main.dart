import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/data/constants.dart';
import 'package:what_to_do/data/data.dart';
import 'package:what_to_do/custom/my_custom_scroll_behavior.dart';
import 'package:what_to_do/home.dart';
import 'package:what_to_do/presentation.dart';
import 'package:what_to_do/style/themes.dart';

import 'object/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  final prefs = await SharedPreferences.getInstance();
  Themes.defaultIndex = prefs.getInt('defaultIndex') ?? 0;
  bool presentation = prefs.getBool('presentation') ?? true;

  if (Platform.isAndroid) {
    MobileAds.instance.initialize();
  }

  runApp(
    Main(
      savedThemeMode: savedThemeMode,
      presentation: presentation,
    ),
  );

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

class Main extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final bool presentation;
  const Main({
    super.key,
    required this.savedThemeMode,
    required this.presentation,
  });

  @override
  State<StatefulWidget> createState() => _Main();
}

class _Main extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Themes.colors[Themes.defaultIndex],
        useMaterial3: true,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Themes.colors[Themes.defaultIndex],
        useMaterial3: true,
      ),
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'What To Do?',
        theme: theme,
        darkTheme: darkTheme,
        home: widget.presentation ? const Presentation() : const Home(),
      ),
    );
  }
}
