import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_delivery/Pages/Home.dart';
import 'package:grocery_delivery/Pages/OrderList.dart';
import 'package:grocery_delivery/page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PageProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {'/': (context) => SplashScreen()},
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
          ),
          Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Grocery delivery\nat your door',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins()
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Order grocery from any where and\nget delivery at your door',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightGreen,
                      ),
                      child: Text(
                        'Order Now',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins()
                            .copyWith(fontSize: 18, color: Colors.white),
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

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return OrderListPage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: body(),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return BottomAppBar(
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: pageProvider.currentIndex,
          selectedItemColor: Colors.lightGreenAccent,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            pageProvider.currentIndex = value;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services_outlined), label: ''),
          ]),
    );
  }
}
