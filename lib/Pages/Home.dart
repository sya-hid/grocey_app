import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.grid_view,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Your Location',
              style: GoogleFonts.poppins()
                  .copyWith(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'Eren Yager, Indonesia',
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
        actions: [
          IconButton(
            color: Colors.grey.withOpacity(0.2),
            icon: ClipOval(child: Image.asset("assets/profile.png")),
            onPressed: () {},
          )
        ],
      ),
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
          MostOrdered(),
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Show All",
              style: GoogleFonts.poppins().copyWith(color: Colors.lightGreen),
            ),
          )
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
            title: 'Orange',
            picture: 'orange.png',
            price: 10,
            press: () {},
          ),
          MostOrderedCard(
            title: 'Grape',
            picture: 'grape.png',
            price: 25,
            press: () {},
          ),
          MostOrderedCard(
            title: 'Banana',
            picture: 'banana.png',
            price: 35,
            press: () {},
          ),
          MostOrderedCard(
            title: 'Honeydew',
            picture: 'honeydew.png',
            price: 20,
            press: () {},
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

class MostOrderedCard extends StatelessWidget {
  final String title, picture;
  final double price;
  final Function press;
  const MostOrderedCard({
    Key key,
    @required this.title,
    @required this.picture,
    @required this.press,
    @required this.price,
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
              print(title);
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
                    child: Image.asset(
                      'assets/' + picture,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
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
                                  text: '\$$price ',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                TextSpan(
                                  text: 'perKg',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          IconButton(icon: Icon(Icons.add), iconSize: 14)
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
