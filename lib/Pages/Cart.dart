import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/AppBar.dart';
import 'package:grocery_delivery/Pages/cart_item.dart';
import 'package:grocery_delivery/Pages/cart_provider.dart';
import 'package:grocery_delivery/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
 
      appBar: AppBar2(context),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                datacarts.length.toString() + ' Items ready for checkout',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    ...List.generate(
                      datacarts.length,
                      (index) => CartCard(cart: datacarts[index]),
                    ),
                    // ...List.generate(
                    //   datacarts.length,
                    //   (index) => CartCard(cart: datacarts[index]),
                    // ),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightGreen,
                ),
                child: Text(
                  'Checkout',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins()
                      .copyWith(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
