import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
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
        children:[
          HomePage(),
          FavoritePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        child: BottomNavigationBar(
          elevation: 10,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).scaffoldBackgroundColor,
          unselectedItemColor: Colors.white38,
        ),
      ),
    );
  }
}
