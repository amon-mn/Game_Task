import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> tasklist = [
    Task(
        name: 'Aprender Flutter',
        picture: 'assets/images/flutter.jpg',
        difficultyLevel: 5),
    Task(
        name: 'Aprender Design Gráfico',
        picture: 'assets/images/creativeCloud.jpg',
        difficultyLevel: 4),
    Task(
        name: 'Aprender Figma',
        picture: 'assets/images/figmaBlurr.jpg',
        difficultyLevel: 3),
    Task(
        name: 'A Arte da Guerra',
        picture: 'assets/images/livro1.webp',
        difficultyLevel: 5),
    Task(
        name: 'Tecnicas de Invasão',
        picture: 'assets/images/livro2.jpg',
        difficultyLevel: 5),
    Task(
        name: 'Convencer Alguem em 90s',
        picture: 'assets/images/livro3.jpg',
        difficultyLevel: 4),
  ];

  void newTask(String name, String picture, int difficultyLevel){
    tasklist.add(Task(name: name, picture: picture, difficultyLevel: difficultyLevel));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.tasklist.length != tasklist.length;
  }
}
