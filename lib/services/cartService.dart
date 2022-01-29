import 'dart:convert';
import 'package:grocery_delivery/models/cart.dart';
import 'package:http/http.dart' as http;

class CartService {
  Future<List<CartModel>> getCarts() async {
    var apiUrl =
        Uri.parse("https://6072846de4e0160017ddeaf5.mockapi.io/api/carts");
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<CartModel> carts = [];
      for (var item in data) {
        carts.add(CartModel.fromJson(item));
      }
      return carts;
    } else {
      throw Exception('Failed to load');
    }
  }
}
