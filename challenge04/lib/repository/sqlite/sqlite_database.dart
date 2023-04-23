import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';

class SqliteDataBase {
  static Database? db;

  Future<Database> getDataBase() async {
    if (db == null) {
      return await initDB();
    }
    return db!;
  }

  Map<int, String> scripts = {
    1: ''' CREATE TABLE tarefas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT,
    concluido INTEGER
    ); ''',
  };

  Future initDB() async {
    var db = openDatabase(
      path.join(await getDatabasesPath(), 'database.C04DB'),
      version: scripts.length,
      onCreate: (db, version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
    );
    return db;
  }
}
