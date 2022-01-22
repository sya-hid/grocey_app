import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/ordered_item_card.dart';
import 'package:grocery_delivery/models/order.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SectionTile(title: '19 Jan 2022'),
            SizedBox(height: 30),
            OrderListItemPending(),
            SizedBox(height: 30),
            SectionTile(title: '15 Jan 2022'),
            OrderListItemDelivered(),
          ],
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
      child: Text(
        title,
        style: GoogleFonts.poppins().copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class OrderListItemPending extends StatelessWidget {
  const OrderListItemPending({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          ...List.generate(
            orderPending.length,
            (index) => OrderedItemCard2(
              press: () {},
              order: orderPending[index],
            ),
          ),
          // OrderedItemCard(
          //   picture: 'orange.png',
          //   title: 'Orange',
          //   price: 20,
          //   items: 2,
          //   press: () {},
          //   status: 'pending',
          // ),
          // OrderedItemCard(
          //   picture: 'grape.png',
          //   title: 'Grape',
          //   price: 20,
          //   items: 3,
          //   press: () {},
          //   status: 'pending',
          // ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

class OrderListItemDelivered extends StatelessWidget {
  const OrderListItemDelivered({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          ...List.generate(
              orderDelivered.length,
              (index) =>
                  OrderedItemCard2(press: () {}, order: orderDelivered[index])),
          // OrderedItemCard(
          //   picture: 'orange.png',
          //   title: 'Orange',
          //   price: 20,
          //   items: 1,
          //   press: () {},
          //   status: 'delivered',
          // ),
          // OrderedItemCard(
          //   picture: 'banana.png',
          //   title: 'Banana',
          //   price: 20,
          //   items: 3,
          //   press: () {},
          //   status: 'delivered',
          // ),
          // OrderedItemCard(
          //   picture: 'honeydew.png',
          //   title: 'Honeydew',
          //   price: 20,
          //   items: 4,
          //   press: () {},
          //   status: 'delivered',
          // ),
          // OrderedItemCard(
          //   picture: 'grape.png',
          //   title: 'Grape',
          //   price: 20,
          //   items: 3,
          //   press: () {},
          //   status: 'delivered',
          // ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

class OrderedItemCard extends StatelessWidget {
  final String picture, title, status;
  final Function press;
  final double price, items;
  const OrderedItemCard({
    Key key,
    @required this.picture,
    @required this.title,
    @required this.price,
    @required this.items,
    @required this.press,
    @required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
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
              'assets/' + picture,
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
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
                      text: '\$$price',
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
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status == 'pending' ? 'Pending' : 'Delivered',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 18,
                  color:
                      status == 'pending' ? Colors.yellow : Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '\$${price * items}',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' $items kg',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
