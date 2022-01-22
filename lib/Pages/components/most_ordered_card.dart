import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/models/product.dart';

class MostOrderedCard2 extends StatelessWidget {
  final ProductModel product;
  final Function press;
  const MostOrderedCard2({
    Key key,
    @required this.press,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFB0CCE1).withOpacity(0.32))
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print(product.name);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    child: Hero(
                      tag: product.id,
                      child: FadeInImage.assetNetwork(
                          width: 90,
                          height: 90,
                          placeholder: "assets/spinner.gif",
                          image: "assets/" + product.image),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      // SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$${product.price} ',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                TextSpan(
                                  text: 'perKg',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              Icons.add,
                              size: 12,
                            ),
                          ),
                          // IconButton(
                          //   icon: Icon(Icons.add),
                          //   iconSize: 14,
                          //   onPressed: () {},
                          // )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
