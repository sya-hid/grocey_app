import 'package:flutter/material.dart';

class ProductModel {
  double price;
  int id;
  String name, image;
  ProductModel({
    this.name,
    this.image,
    this.price,
    this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json["name"] as String,
        image: json["image"] as String,
        price: json["price"] as double,
        id: json["id"] as int);
  }

  // Map<String, dynamic> toJson() {
  //   return {'id': id, 'name': name, 'price': price, 'image': image};
  // }

  // ProductModel.fromJson(Map<String, dynamic> json)
  //     : id = json["id"],
  //       name = json["name"],
  //       price = double.parse(json["price"].toString()),
  //       image = json["image"];

  // Map<String, dynamic> toJson() {
  //   return {
  //     "name": name,
  //     "image": image,
  //     "price": price,
  //     "id": id,
  //   };
  // }
}

// [{"name":"Grape","image":"grape.png","price":18,"id":"1"},{"name":"Honeydew","image":"honeydew.png","price":20,"id":"2"},{"name":"Orange","image":"orange.png","price":19,"id":"3"},{"name":"Banana","image":"banana.png","price":15,"id":"4"}]

List<ProductModel> dataProducts = [
  ProductModel(id: 1, price: 20, name: 'Grape', image: 'grape.png'),
  ProductModel(id: 2, price: 22, name: 'Honeydew', image: 'honeydew.png'),
  ProductModel(id: 3, price: 15, name: 'Orange', image: 'orange.png'),
  ProductModel(id: 4, price: 25, name: 'Banana', image: 'banana.png'),
];
