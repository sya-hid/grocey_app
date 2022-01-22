import 'package:grocery_delivery/models/product.dart';
import 'package:flutter/material.dart';

class Order {
  final String status;
  final int jumlah;
  final Product product;

  Order({
    @required this.product,
    @required this.jumlah,
    @required this.status,
  });
}

List<Order> orderPending = [
  Order(product: products[1], status: 'Pending', jumlah: 2),
  Order(product: products[3], status: 'Pending', jumlah: 4)
];

List<Order> orderDelivered = [
  Order(product: products[1], status: 'Delivered', jumlah: 3),
  Order(product: products[2], status: 'Delivered', jumlah: 2),
  Order(product: products[0], status: 'Delivered', jumlah: 1),
  Order(product: products[3], status: 'Delivered', jumlah: 2),
];
