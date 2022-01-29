import 'package:flutter/material.dart';
import 'package:grocery_delivery/Pages/Cart.dart';
import 'package:grocery_delivery/Pages/Home.dart';
import 'package:grocery_delivery/Pages/More.dart';
import 'package:grocery_delivery/Pages/OrderList.dart';
import 'package:grocery_delivery/page_provider.dart';
import 'package:grocery_delivery/provider/cartProvider.dart';
import 'package:grocery_delivery/provider/productProvider.dart';
import 'package:grocery_delivery/provider/userProvider.dart';
import 'package:grocery_delivery/splah_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          // '/mainPage': (context) => MainPage(),
        },
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
        case 2:
          return CartPage();
          break;
        case 3:
          return MorePage();
          break;
        // case 4:
        //   return Produk();
        //   break;
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
          selectedItemColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            pageProvider.currentIndex = value;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: 'Order List'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services_outlined),
                label: 'More'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.chat_outlined), label: 'Message'),
          ]),
    );
  }
}
