import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/models/user.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> order_sum = [
      {'text': "Total Order", 'number': 323},
      {'text': "Delivered", 'number': 305},
      {'text': "Pending", 'number': 18},
    ];
    List<Map<String, dynamic>> option = [
      {'icon': Icons.person_outline_outlined, 'text': 'Edit Profile'},
      {'icon': Icons.credit_card_outlined, 'text': 'Payment Method'},
      {'icon': Icons.person_add_alt_1_outlined, 'text': 'Invite Friends'},
    ];
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: ClipOval(
                      child: Image.asset('assets/' + user.image),
                    ),
                  ),
                  Text(user.name,
                      style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Text(user.email,
                      style: GoogleFonts.poppins().copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ))
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Order Summary',
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  order_sum.length,
                  (index) => OrderCard(
                    number: order_sum[index]['number'],
                    text: order_sum[index]['text'],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    option.length,
                    (index) => ListOptionCard(
                      ikon: option[index]['icon'],
                      text: option[index]['text'],
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListOptionCard extends StatelessWidget {
  final IconData ikon;
  final String text;

  const ListOptionCard({
    Key key,
    @required this.ikon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            ikon,
            size: 28,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 22),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String text;
  final int number;
  const OrderCard({
    Key key,
    @required this.text,
    @required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red.withOpacity(0.2),
      ),
      child: Column(children: [
        Text(
          number.toString(),
          style: GoogleFonts.poppins().copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.poppins().copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ]),
    );
  }
}
