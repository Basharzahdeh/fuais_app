import 'package:flutter/material.dart';

import '../models/daily_task_model.dart';

class DailyTaskProvider with ChangeNotifier {
  final List<DailyTaskModel> _listDailyTask = [];

  List<DailyTaskModel> get listDailyTask {
    return [..._listDailyTask];
  }
}
