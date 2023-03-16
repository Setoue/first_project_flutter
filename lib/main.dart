import 'package:flutter/material.dart';
import 'package:primeiro_flutter/data/task_inherited.dart';
import 'package:primeiro_flutter/screens/form_screen.dart';
import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}
// https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg