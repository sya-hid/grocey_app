import 'package:flutter/material.dart';

class Product {
  double price;
  String name, image;
  int id;
  Product({
    @required this.id,
    @required this.price,
    @required this.name,
    @required this.image,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = double.parse(json['price'].toString());
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price, 'image': image};
  }
}

List<Product> products = [
  Product(id: 1, price: 20, name: 'Grape', image: 'grape.png'),
  Product(id: 2, price: 22, name: 'Honeydew', image: 'honeydew.png'),
  Product(id: 3, price: 15, name: 'Orange', image: 'orange.png'),
  Product(id: 4, price: 25, name: 'Banana', image: 'banana.png'),
];
