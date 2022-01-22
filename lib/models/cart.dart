import 'package:grocery_delivery/models/product.dart';
import 'package:flutter/material.dart';

class Cart {
  int jumlah, id;
  Product product;

  Cart({
    @required this.product,
    @required this.jumlah,
    @required this.id,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromJson(json['product']);
    jumlah = json['jumlah'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'jumlah': jumlah,
    };
  }
}

List<Cart> datacarts = [
  Cart(id: 1, product: products[1], jumlah: 2),
  Cart(id: 2, product: products[3], jumlah: 4),
  Cart(id: 3, product: products[0], jumlah: 4),
];
