import 'package:flutter/material.dart';

import '../models/employees_model.dart';

class EmployeesProvider with ChangeNotifier {
  final List<EmployeesModel> _listEmployee = [];

  List<EmployeesModel> get listEmployee {
    return [..._listEmployee];
  }
}
