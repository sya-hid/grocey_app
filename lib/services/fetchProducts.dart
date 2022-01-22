// Fetch our Products from API
import 'dart:convert';
import 'package:grocery_delivery/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> fetchProducts() async {
  var apiUrl =
      Uri.parse("https://6072846de4e0160017ddeaf5.mockapi.io/api/product");
  // var headers = {'Content-Type': 'application/json'};

  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    // List<ProductModel> products = (jsonDecode(response.body) as List)
    //     .map((data) => ProductModel.fromJson(data))
    //     .toList();

    List data = jsonDecode(response.body);
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    // Return list of products
    // print(products);
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
