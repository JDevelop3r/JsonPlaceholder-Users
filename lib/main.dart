import 'package:flutter/material.dart';
import 'package:prueba_antpack/Users/screens/UserList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JsonPlaceholder Users',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: UserList(title: 'JSONPlaceholder Users'),
    );
  }
}
