import 'package:first_project/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_project/data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_task),
        title: const Text(
          'Tarefas',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
        children: TaskInherited.of(context).tasklist,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: context,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
