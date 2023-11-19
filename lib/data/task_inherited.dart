import 'package:flutter/material.dart';
import 'package:projeto_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    const Task(
      name: 'Aprender Flutter',
      photo: 'assets/images/dash.png',
      difficulty: 3,
    ),
    const Task(
      name: 'Andar de Bike',
      photo: 'assets/images/bike.jpg',
      difficulty: 2,
    ),
    const Task(
      name: 'Meditar',
      photo: 'assets/images/meditar.jpeg',
      difficulty: 5,
    ),
    const Task(
      name: 'Ler',
      photo: 'assets/images/livro.jpg',
      difficulty: 4,
    ),
    const Task(
      name: 'Jogar',
      photo: 'assets/images/jogar.jpg',
      difficulty: 1,
    ),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(
      Task(
        name: name,
        photo: photo,
        difficulty: difficulty,
      ),
    );
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
