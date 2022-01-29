import 'dart:convert';

import 'package:grocery_delivery/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserModel> getUser() async {
    var url =
        Uri.parse("https://6072846de4e0160017ddeaf5.mockapi.io/api/user/1");
    final response = await http.get(url);

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception('Failed to load');
    }
  }
}
