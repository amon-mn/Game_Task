import 'package:first_project/screens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_project/data/task_inherited.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}






