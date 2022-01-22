import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/cart_provider.dart';
import 'package:grocery_delivery/models/cart.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final Cart cart;

  const CartCard({this.cart});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightGreen.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/' + cart.product.image,
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.name,
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '\$${cart.product.price}',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' perKg',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${cart.product.price * cart.jumlah}',
                style: GoogleFonts.poppins()
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Spacer(),
          Row(children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                ),
                onPressed: () {
                  print(cartProvider.carts);
                }),
            Text(cart.jumlah.toString()),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onPressed: () {
                  cartProvider.addjumlah(cart.id);
                  print(cartProvider.addjumlah(cart.id));
                })
          ]),
        ],
      ),
    );
  }
}
