import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> main() async {
  // Open the database (or create if it doesn't exist)
  Database database = await openDatabase(
    join(await getDatabasesPath(), 'example_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT)',
      );
    },
    version: 1,
  );

  // Insert some data into the table
  await database.insert(
    'my_table',
    {'name': 'John Doe'},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  // Query the database for all rows
  List<Map<String, dynamic>> results = await database.query('my_table');

  // Print the results
  print(results);
}
