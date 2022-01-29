import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/components/AppBar.dart';
import 'package:grocery_delivery/models/user.dart';
import 'package:grocery_delivery/size_config.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    List<Map<String, dynamic>> orderSum = [
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
      extendBodyBehindAppBar: true,
      appBar: appBar1(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.3,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(100),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.3 - 75),
                      Container(
                        width: 150,
                        height: 150,
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            image: user.image,
                            placeholder: "assets/spinner.gif",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: defaultSize * 5),
                      Text(
                        user.name,
                        style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: defaultSize * 1),
                      Text(
                        user.email,
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: defaultSize * 4),
                  Text(
                    'Order Summary',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: defaultSize * 1),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          orderSum.length,
                          (index) => OrderCard(
                            number: orderSum[index]['number'],
                            text: orderSum[index]['text'],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      // height: SizeConfig.screenHeight * 0.5,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ),
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
              fontSize: 18,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios,
              color: Colors.grey.withOpacity(0.5), size: 22),
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
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
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
      ),
    );
  }
}
