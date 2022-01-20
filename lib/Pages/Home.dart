import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.grid_view,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Your Location',
              style: GoogleFonts.poppins().copyWith(color: Colors.grey),
            ),
            Text(
              'Eren Yager, Indonesia',
              style: GoogleFonts.poppins().copyWith(color: Colors.black),
            )
          ],
        ),
        actions: [
          Icon(
            Icons.person_outline,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 250,
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
                            child: Icon(Icons.tune_outlined)),
                        contentPadding: const EdgeInsets.all(16)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Ordered',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              GestureDetector(onTap: () {}, child: Text("Show All"))
            ],
          ),
          MostOrdered()
        ],
      ),
    );
  }
}

class MostOrdered extends StatelessWidget {
  const MostOrdered({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MostOrderedCard(
              title: 'Onions',
              shopName: 'shopName',
              svgPic: 'svgPic',
              price: 10,
              press: () {}),
          MostOrderedCard(
              title: 'Blue Berry',
              shopName: 'shopName',
              svgPic: 'svgPic',
              price: 25,
              press: () {}),
          MostOrderedCard(
              title: 'Plum Wine',
              shopName: 'shopName',
              svgPic: 'svgPic',
              price: 35,
              press: () {}),
          MostOrderedCard(
              title: 'Orange',
              shopName: 'shopName',
              svgPic: 'svgPic',
              price: 20,
              press: () {}),
        ],
      ),
    );
  }
}

class MostOrderedCard extends StatelessWidget {
  final String title, shopName, svgPic;
  final double price;
  final Function press;
  const MostOrderedCard({
    Key key,
    @required this.title,
    @required this.shopName,
    @required this.svgPic,
    @required this.press,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.red,
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
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    // child: SvgPicture.asset(
                    //   svgPic,
                    //   width: size.width * 0.18,
                    // ),
                    child: Icon(Icons.ac_unit_outlined),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: '\$$price ',
                              style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            TextSpan(
                              text: 'perKg',
                              style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.normal, fontSize: 12),
                            )
                          ])),
                          Icon(Icons.add, size: 14)
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
