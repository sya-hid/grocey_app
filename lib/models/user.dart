import 'package:flutter/material.dart';

class User {
  final String name, image, email, location;

  User(
      {@required this.email,
      @required this.location,
      @required this.name,
      @required this.image});
}

User user = User(
    email: 'eren_yager@mail.com',
    location: 'AoT World',
    image: 'profile.png',
    name: 'Eren Yeager');
