import 'package:sqflite/sqflite.dart';

import '../object/activity.dart';

class Activities {
  static List<Activity> listActivity = [];

  static void insert(Database database, Activity activity) {
    database
        .insert(
          'activities',
          activity.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) {});
  }

  static void update(Database database, Activity activity) {
    database.update(
      'activities',
      activity.toMap(),
      where: 'key = ?',
      whereArgs: [activity.key],
    ).then((value) {});
  }

  static void delete(Database database, Activity activity) {
    database.delete(
      'activities',
      where: 'key = ?',
      whereArgs: [activity.key],
    ).then((value) {});
  }

  static Future<List<Activity>> getActivities(Database database) async {
    final maps = await database.query('activities');
    final activities = List.generate(maps.length, (i) {
      return Activity(
        activity: maps[i]['activity'] as String,
        type: maps[i]['type'] as String,
        participants: maps[i]['participants'] as int,
        price: maps[i]['price'] as double,
        link: maps[i]['link'] as String,
        key: maps[i]['key'] as String,
        accessibility: maps[i]['accessibility'] as double,
      );
    });

    return activities;
  }

  static void setDataReady() {
    openDatabase(
      'wtd.db',
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE activities(activity TEXT, type TEXT, participants INTEGER, price REAL, link TEXT, key TEXT PRIMARY KEY, accessibility REAL)',
        );
      },
      version: 1,
    ).then((value) {
      getActivities(value).then((value) {
        listActivity = value;
      });
    });
  }
}
