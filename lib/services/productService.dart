import 'dart:convert';
import 'package:grocery_delivery/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    var apiUrl =
        Uri.parse("https://6072846de4e0160017ddeaf5.mockapi.io/api/product");
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      // List<ProductModel> products = (jsonDecode(response.body) as List)
      //     .map((data) => ProductModel.fromJson(data))
      //     .toList();

      List data = jsonDecode(response.body);
      // print(response.body);
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to load');
    }
  }

}
