import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentPage = 0;
  List<Widget> pages = [
    HomePage(),
    Text("dummy Favorite Page"),
    Text("Dummy Account Page")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 208, 28, 37),
        foregroundColor: Colors.white,
        //shadowColor: Colors.black38,
        elevation: 10, //App bar shadow
        title: const Center(
          child: Text(
            'Talabak',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Drawer(child: ListView()),
      bottomNavigationBar: BottomNavigationBar(
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
          });
        },
        selectedItemColor: Color.fromARGB(255, 255, 237, 191),
        backgroundColor: Color.fromARGB(255, 208, 28, 37),
      ),
      body: pages[_currentPage],
    );
  }
}
