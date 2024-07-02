import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentPage = 0;
  final PageController _homePageController = PageController();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Talabak',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(child: ListView()),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _homePageController,
        onPageChanged: (index) => setState(() {
          _currentPage = index;
        }),
        children: const [
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
            setState(() {
              _currentPage = index;
              _homePageController.animateToPage(
                _currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
              debugPrint("page  $_currentPage");
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).scaffoldBackgroundColor,
          unselectedItemColor: Colors.white38,
        ),
      ),
    );
  }
}
