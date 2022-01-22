import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/cart_item.dart';
import 'package:grocery_delivery/Pages/cart_provider.dart';
import 'package:grocery_delivery/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      // body: Column(
      //   children: [
      //     ...List.generate(
      //         datacarts.length, (index) => CartCard(cart: datacarts[index])),
      //   ],
      // ),
      appBar: AppBar(
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
      ),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                datacarts.length.toString() + ' Item Ready For Checkout',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            ...List.generate(
              datacarts.length,
              (index) => CartCard(cart: datacarts[index]),
            ),
            // : ListView(
            //     children: datacarts.map((e) => CartCard(cart: e)).toList(),
            //   ),
          ],
        ),
      ),
    );
  }
}
