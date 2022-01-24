import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/models/user.dart';

AppBar appBar1(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Icon(
      Icons.grid_view,
      color: Colors.black,
    ),
    centerTitle: true,
    title: Column(
      children: [
        Text(
          'Your Location',
          style:
              GoogleFonts.poppins().copyWith(fontSize: 14, color: Colors.grey),
        ),
        Text(
          user.name + ', ' + user.location,
          style: GoogleFonts.poppins().copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    ),
    actions: [
      IconButton(
        color: Colors.grey.withOpacity(0.2),
        icon: ClipOval(
            child: Image.network(
          user.image,
          width: 30,
          height: 30,
          fit: BoxFit.fill,
        )),
        onPressed: () {},
      )
    ],
  );
}

AppBar appBar2(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.black,
        size: 16,
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        color: Colors.black,
        icon: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        onPressed: () {},
      )
    ],
  );
}
