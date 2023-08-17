import 'package:flutter/cupertino.dart';

import '../models/task_handing_model.dart';

class taskHandingProvider with ChangeNotifier {
  final List<TaskHandingModel> _listTaskHanding = [];

  List<TaskHandingModel> get listTaskHanding {
    return [..._listTaskHanding];
  }
}
