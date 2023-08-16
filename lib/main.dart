import 'package:flutter/material.dart';
import 'package:fuais_app/ui/main/creat_account_screen.dart';
import 'package:fuais_app/ui/main/fuais_screen.dart';
import 'package:fuais_app/ui/main/home_screen.dart';
import 'package:fuais_app/ui/tasks/dailytask_screen.dart';
import 'package:fuais_app/ui/tasks/task_handing_screen.dart';

import 'ui/tasks/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DailyTaskScreen(),
    );
  }
}
