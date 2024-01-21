import 'package:flutter/material.dart';
import 'package:sqliteworker/SQLhelper.dart';
// import 'd';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFlite Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // Insert user data
                await dbHelper.insertUser({'name': 'John Doe', 'age': 26});
                print('User inserted');
              },
              child: Text('Insert User'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Retrieve users from the database
                List<Map<String, dynamic>> users = await dbHelper.getUsers();
                print('Users: $users');
              },
              child: Text('Retrieve Users'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Delete user with ID 1
                await dbHelper.deleteUser(1);
                print('User deleted');
              },
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}
