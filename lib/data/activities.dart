import 'package:sqflite/sqflite.dart';

final database = openDatabase(
  'wtd.db',
  onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE activities(activity TEXT, type TEXT, participants INTEGER, price REAL, link TEXT, key TEXT PRIMARY KEY, accessibility REAL)',
    );
  },
  version: 1,
);
