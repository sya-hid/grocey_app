import 'package:grocery_delivery/models/product.dart';
import 'package:flutter/material.dart';

class CartModel {
  int jumlah;
  int id;
  ProductModel product;

  CartModel({
    @required this.product,
    @required this.jumlah,
    @required this.id,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
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

List<CartModel> carts = [
  CartModel(id: 1, product: products[1], jumlah: 2),
  CartModel(id: 2, product: products[3], jumlah: 4),
  CartModel(id: 3, product: products[0], jumlah: 4),
];
