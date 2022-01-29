import 'package:flutter/material.dart';
import 'package:grocery_delivery/models/user.dart';
import 'package:grocery_delivery/services/userService.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;
  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<void> getuser() async {
    try {
      UserModel user = await UserService().getUser();
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
