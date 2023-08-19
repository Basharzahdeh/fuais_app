import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UsersProvider with ChangeNotifier {
  final List<UsersModel> _listUser = [
    UsersModel(
      userId: '1',
      userName: 'محمد القناص',
      userPosition: 'flutter developer',
      imageUrl: 'assets/images/img.png',
      status: 'status',
      enterTime: DateTime.now(),
      outTime: DateTime.now(),
    )
  ];

  List<UsersModel> get listUser {
    return [..._listUser];
  }
}
