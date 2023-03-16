import 'package:flutter/material.dart';
import 'package:primeiro_flutter/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Ler', 4, 'assets/images/coruja.png'),
    Task('Meditar', 2, 'assets/images/meditar.jpeg'),
    Task('Jogar', 1, 'assets/images/jogar.jpg'),
  ];

  void newTask(String name, String photo, int difficulty){

    taskList.add(Task(name, difficulty, photo));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
