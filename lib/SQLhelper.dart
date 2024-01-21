import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // If _database is null, instantiate it
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'hello_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables when the database is created
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final Database db = await database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final Database db = await database;
    return await db.query('users');
  }

  Future<int> deleteUser(int userId) async {
    final Database db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [userId]);
  }
}
