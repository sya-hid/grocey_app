import 'dart:convert';

import 'package:grocery_delivery/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserModel> getUser() async {
    var url =
        Uri.parse("https://6072846de4e0160017ddeaf5.mockapi.io/api/user/1");
    final response = await http.get(url);
    // print(response.body);
    // print(response.statusCode);
    var tes =
        '{"name":"Freda Streich","image":"https://cdn.fakercloud.com/avatars/carlosjgsousa_128.jpg","location":"New Birdiestad","email":"Rosemarie37@yahoo.com","id":1}';
    // UserModel user;
    // print(data);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // user = UserModel.fromJson(data);
      // for (var item in data) {
      user = UserModel.fromJson(data);
      // }
      print(user.email);
      return user;
    } else {
      throw Exception('Failed to load');
    }
  }
}
