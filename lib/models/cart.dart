import 'package:grocery_delivery/models/product.dart';
import 'package:flutter/material.dart';

class Cart {
  int jumlah, id;
  ProductModel product;

  Cart({
    @required this.product,
    @required this.jumlah,
    @required this.id,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
      jumlah: json['jumlah'],
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'product': product.toJson(),
  //     'jumlah': jumlah,
  //   };
  // }
}

List<Cart> datacarts = [
  Cart(id: 1, product: dataProducts[1], jumlah: 2),
  Cart(id: 2, product: dataProducts[3], jumlah: 4),
  Cart(id: 3, product: dataProducts[0], jumlah: 4),
];
