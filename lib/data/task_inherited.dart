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
        image: 'assets/images/flutter.jpg',
        difficulty: 5),
    Task(
        name: 'Aprender Design Gráfico',
        image: 'assets/images/creativeCloud.jpg',
        difficulty: 4),
    Task(
        name: 'Aprender Figma',
        image: 'assets/images/figmaBlurr.jpg',
        difficulty: 3),
    Task(
        name: 'A Arte da Guerra',
        image: 'assets/images/livro1.webp',
        difficulty: 5),
    Task(
        name: 'Tecnicas de Invasão',
        image: 'assets/images/livro2.jpg',
        difficulty: 5),
    Task(
        name: 'Convencer Alguem em 90s',
        image: 'assets/images/livro3.jpg',
        difficulty: 4),
  ];

  void newTask(String name, String picture, int difficultyLevel){
    tasklist.add(Task(name: name, image: picture, difficulty: difficultyLevel));
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
