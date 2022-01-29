import 'package:flutter/material.dart';
import 'package:grocery_delivery/models/cart.dart';
import 'package:grocery_delivery/models/product.dart';
import 'package:grocery_delivery/services/cartService.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> _toRemove = [];
  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  Future<void> getCarts() async {
    try {
      List<CartModel> carts = await CartService().getCarts();
      _carts = carts;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
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
        CartModel(
          id: _carts.length,
          product: product,
          jumlah: 1,
        ),
      );
    }
    notifyListeners();
  }

  removeCart(int id) {
    if (_carts.length > 0) {
      _carts.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }

  addQuantity(int id) {
    _carts.where((element) => element.id == id).forEach((element) {
      element.jumlah++;
    });
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts.where((element) => element.id == id).forEach((element) {
      element.jumlah--;
      if (element.jumlah == 0) {
        _toRemove.add(element);
      }
    });
    _carts.removeWhere((element) => _toRemove.contains(element));
    // _carts[id].jumlah--;
    // if (_carts[id].jumlah == 0) {
    //   _carts.removeAt(id);
    // }
    notifyListeners();
  }
}
