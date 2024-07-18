import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with WidgetsBindingObserver {
  int _currentPage = 0;
  final PageController _homePageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //the system state listener
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance
        .removeObserver(this); //removing the system state listener
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("$state");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Talabak',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // appBar: CupertinoNavigationBar( //for ios
      //   middle: Text("Talabak")
      // ),
      drawer: Drawer(child: ListView()),
      body: PageView(
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        controller: _homePageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
            debugPrint("onPageChanged");
          });
        },
        children:  [
          HomePage(),
          FavoritePage(),
          const ProfilePage(),
          const CartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: const IconThemeData(
            // color: Colors.grey,
            // fill: 0.1
            //grade: 10
            size: 20),
        type: BottomNavigationBarType.fixed,
        // fixedColor:Theme.of(context).primaryColor ,
        elevation: 10,
        items: [
          const BottomNavigationBarItem(
              activeIcon: Icon(Ionicons.md_home),
              icon: Icon(Ionicons.md_home_outline),
              label: 'Home'),
          const BottomNavigationBarItem(
              activeIcon: Icon(Ionicons.heart),
              icon: Icon(Icons.favorite_outline_rounded),
              label: 'Favorite'),
          const BottomNavigationBarItem(
              activeIcon: Icon(Ionicons.person),
              icon: Icon(Ionicons.person_outline),
              label: 'Profile'),
          BottomNavigationBarItem(
            activeIcon: const Icon(Ionicons.cart),
              icon: Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(Ionicons.cart_outline),
                    Cart.instance.cartList().isNotEmpty
                        ? Container(
                            width: 10,
                            height: 14,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Column(
                              children: [
                                Text(
                                  "${Cart.instance.cartList().length}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ]),
              label: 'Cart'),
        ],
        currentIndex: _currentPage,
        onTap: (index) {
          // _homePageController.animateToPage(
          //   index,
          //   duration: const Duration(milliseconds: 300),
          //   curve: Curves.ease,
          // );
          _homePageController.jumpToPage(index);
        },
      ),
    );
  }
}
