import 'package:flutter/material.dart';
import 'package:grocery_delivery/models/cart.dart';
import 'package:grocery_delivery/models/product.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];

  List<Cart> get carts => _carts;

  set carts(List<Cart> carts) {
    _carts = carts;
    notifyListeners();
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].jumlah++;
    } else {
      _carts.add(
        Cart(
          id: _carts.length,
          product: product,
          jumlah: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addjumlah(int id) {
    _carts[id].jumlah++;
    notifyListeners();
  }

  reducejumlah(int id) {
    _carts[id].jumlah--;
    if (_carts[id].jumlah == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.jumlah;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.jumlah * item.product.price);
    }
    return total;
  }
}
