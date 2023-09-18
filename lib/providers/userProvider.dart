import 'package:flutter/material.dart';
import 'package:treasury/resources/auth_method.dart';

import '../helper/models/db_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  final AuthMethod _authMethod = AuthMethod();

  User get getUser => _user!;

  Future<void> refresh() async {
    User user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
