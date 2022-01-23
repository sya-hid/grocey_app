import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/components/AppBar.dart';
import 'package:grocery_delivery/Pages/components/ordered_item_card.dart';
import 'package:grocery_delivery/models/order.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SectionTile(title: '22 Jan 2022'),
            SizedBox(height: 30),
            OrderListItemPending(),
            SizedBox(height: 30),
            SectionTile(title: '16 Jan 2022'),
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
            (index) => OrderedItemCard2(
              press: () {},
              order: orderDelivered[index],
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
