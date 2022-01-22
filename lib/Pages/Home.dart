import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/components/AppBar.dart';
import 'package:grocery_delivery/Pages/components/most_ordered_card.dart';
import 'package:grocery_delivery/models/product.dart';
import 'package:grocery_delivery/services/fetchProducts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1(context),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'What would you \n like to order ?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      style: GoogleFonts.poppins()
                          .copyWith(fontSize: 16, color: Colors.grey),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: "Search Grocery",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: GoogleFonts.poppins().copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                Icons.tune_outlined,
                                color: Colors.white,
                              )),
                          contentPadding: const EdgeInsets.all(16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          SectionTile(title: 'Most Ordered'),

          //dummy dari mockupio

          FutureBuilder(
            future: fetchProducts(),
            builder: (context, snapshot) => snapshot.hasData
                ? MostOrdered(
                    products: snapshot.data,
                  )
                : Center(child: Image.asset("assets/ripple.gif")),
          ),
          //dummy dari model
          // MostOrdered2(),
          SizedBox(height: 30),
          SectionTile(title: 'Exiting Deals'),
          SizedBox(height: 20),
          ExitingDeals()
        ],
      ),
    );
  }
}

class ExitingDeals extends StatelessWidget {
  const ExitingDeals({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ExitingDealCard(
            text: "40 % Discount On\nFresh Vegetables",
            image: 'vegetable.png',
            press: () {},
          ),
          ExitingDealCard(
            text: "32 % Discount On\nFresh Fruits",
            image: 'fruits.png',
            press: () {},
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class ExitingDealCard extends StatelessWidget {
  final String image, text;
  final Function press;
  const ExitingDealCard({
    Key key,
    @required this.image,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.3)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen),
                          child: Text(
                            'Get Now',
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(child: Image.asset('assets/' + image)),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Show All",
              style: GoogleFonts.poppins().copyWith(
                color: Colors.lightGreen,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MostOrdered extends StatelessWidget {
  final List<ProductModel> products;
  const MostOrdered({
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

class TestT extends StatelessWidget {
  final List<ProductModel> product;
  const TestT({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...List.generate(
            product.length,
            (index) => MostOrderedCard2(
                  press: () {},
                  product: product[index],
                )),
        SizedBox(width: 15),
      ]),
    );
  }
}

class MostOrdered2 extends StatelessWidget {
  const MostOrdered2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...List.generate(
            dataProducts.length,
            (index) => MostOrderedCard2(
                  press: () {},
                  product: dataProducts[index],
                )),
        SizedBox(width: 15),
      ]),
    );
  }
}
