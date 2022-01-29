import 'package:flutter/material.dart';
import 'package:grocery_delivery/Pages/components/most_ordered_card.dart';
import 'package:grocery_delivery/models/product.dart';
import 'package:grocery_delivery/services/productService.dart';

class Produk extends StatelessWidget {
  const Produk({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: ProductService().getProducts(),
          builder: (context, snapshot) => snapshot.hasData
              ? TestT(
                  products: snapshot.data,
                )
              : Text('data kosong'),
        ),
        FutureBuilder(
            future: ProductService().getProducts(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? TestT(products: snapshot.data)
                  : Center(child: Image.asset("assets/ripple.gif"));
            }),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Text here",
            style: TextStyle(fontSize: 18),
          ),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "Text here",
            //style: TextStyle(fontSize: 18),
          ),
        ),  
      ],
    );
  }
}

class TestT extends StatelessWidget {
  final List<ProductModel> products;
  const TestT({
    Key key,
    @required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...List.generate(
            products.length,
            (index) => MostOrderedCard2(
                  press: () {},
                  product: products[index],
                )),
        SizedBox(width: 15),
      ]),
    );
  }
}
