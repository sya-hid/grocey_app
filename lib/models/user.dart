import 'package:flutter/material.dart';

class UserModel {
  // int id;
  String id, name, image, email, location;

  UserModel(
      {@required this.id,
      @required this.email,
      @required this.location,
      @required this.name,
      @required this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"] as String,
        image: json["image"] as String,
        email: json["email"] as String,
        location: json["location"] as String,
        id: json["id"] as String);
  }

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'] as int;
  //   name = json['name'];
  //   email = json['email'];
  //   image = json['image'];
  //   location = json['location'];
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'image': image,
  //     'location': location,
  //   };
  // }
}

UserModel user = UserModel(
    id: "1",
    email: 'eren_yager@mail.com',
    location: 'AoT World',
    image: 'profile.png',
    name: 'Eren Yeager');
