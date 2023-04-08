import 'package:sqflite/sqflite.dart';

import '../object/activity.dart';
import '../object/user.dart';
import 'constants.dart';

List<Activity> listActivity = [];
List<User> listUser = [];

class Data {
  static void insert(Database database, Activity activity, String table) {
    database.insert(
      table,
      activity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static void delete(Database database, Activity activity, String table) {
    database.delete(
      table,
      where: 'key = ?',
      whereArgs: [activity.key],
    );
  }

  static void insertUser(Database database, User user, String table) {
    database.insert(
      table,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static void updateUser(Database database, User user) {
    database.update(
      'users',
      user.toMap(),
      where: "key = ?",
      whereArgs: [user.key],
    );
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

  static Future<List<User>> getUsers(Database database) async {
    final maps = await database.query(userTable);
    final users = List.generate(maps.length, (i) {
      return User(
        key: maps[i]['key'] as int,
        name: maps[i]['name'] as String,
        completed: maps[i]['completed'] as int,
        accepted: maps[i]['accepted'] as int,
        education: maps[i]['education'] as int,
        recreational: maps[i]['recreational'] as int,
        social: maps[i]['social'] as int,
        diy: maps[i]['diy'] as int,
        charity: maps[i]['charity'] as int,
        cooking: maps[i]['cooking'] as int,
        relaxation: maps[i]['relaxation'] as int,
        music: maps[i]['music'] as int,
        busywork: maps[i]['busywork'] as int,
      );
    });

    return users;
  }
}
