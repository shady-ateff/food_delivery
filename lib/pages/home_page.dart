import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/offers_banners.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> color = [Colors.black45];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //App bar shadow
        title: const Center(
          child: Text('Talabak'),
        ),
      ),
      drawer: Drawer(child: ListView()),
      body: ListView(
        shrinkWrap: true,
        //padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 40,
          ),
          OffersBanners()
        ],
      ),
    );
  }
}
