import 'package:flutter/material.dart';
import 'package:grocery_delivery/models/product.dart';
import 'package:grocery_delivery/models/user.dart';
import 'package:grocery_delivery/services/productService.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }

}
