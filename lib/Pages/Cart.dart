import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/components/AppBar.dart';
import 'package:grocery_delivery/Pages/components/cart_item.dart';
import 'package:grocery_delivery/models/cart.dart';
import 'package:grocery_delivery/provider/cartProvider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> cart = cartProvider.carts;
    // int totalPrice = cartProvider.totalPrice();
    // int totalItem = cartProvider.totalItems();
    return Scaffold(
      appBar: appBar1(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            cartProvider.carts.isNotEmpty
                ? Text(
                    cart.length.toString() + ' Items ready for checkout',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                : Text(''),

            SizedBox(height: 20),
            Expanded(
              child: cart.length > 0
                  ? ListView(
                      children: cart.map((e) => CartCard(cart: e)).toList())
                  : Center(
                      child: Text(cart.length.toString() + 'Cart Kosong',
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ))),
            ),

            // Expanded(
            //   child: FutureBuilder(
            //     future: CartService().getCarts(),
            //     builder: (context, snapshot) => snapshot.hasData
            //         ? CartList(
            //             carts: snapshot.data,
            //           )
            //         : Center(child: Image.asset("assets/ripple.gif")),
            //   ),
            // ),
            // Text(totalPrice.toString()),
            // Text(totalItem.toString()),
            // Expanded(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         SizedBox(height: 20),
            //         ...List.generate(
            //           datacarts.length,
            //           (index) => CartCard(cart: datacarts[index]),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                // padding: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                // margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final List<CartModel> carts;
  const CartList({Key key, this.carts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          ...List.generate(
            carts.length,
            (index) => CartCard(cart: carts[index]),
          ),
        ],
      ),
    );
  }
}
