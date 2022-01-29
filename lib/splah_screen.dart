import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:grocery_delivery/provider/cartProvider.dart';
// import 'package:grocery_delivery/provider/productProvider.dart';
import 'package:grocery_delivery/provider/userProvider.dart';
import 'package:grocery_delivery/size_config.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    // CartProvider cartProvider = Provider.of<CartProvider>(context);
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // UserModel datauser = userProvider.user;

    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    getStarted() async {
      await userProvider.getuser();
      // await cartProvider.getCarts();
      // await productProvider.getProducts();
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
      Navigator.popAndPushNamed(context, '/mainPage');
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              height: SizeConfig.screenHeight * 0.65,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/splashImage.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: defaultSize * 2,
            left: 30,
            right: 30,
            child: Container(
              width: SizeConfig.screenWidth * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Grocery delivery at your door',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: defaultSize * 3.5),
                  ),
                  SizedBox(height: defaultSize * 1.5),
                  Text(
                    'Order grocery from any where and get delivery at your door',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: defaultSize * 2,
                        color: Colors.grey),
                  ),
                  SizedBox(height: defaultSize * 1.5),
                  GestureDetector(
                    onTap: getStarted,
                    // onPressed: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => MainPage()));
                    // },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: defaultSize * 1.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightGreen,
                      ),
                      child: Text(
                        'Order Now',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: defaultSize * 2, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
