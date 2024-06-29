import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/menu_widget.dart';
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
    return Column(
      //shrinkWrap: true,
      //padding: const EdgeInsets.all(10),
      children: [
        const SizedBox(
          height: 40,
        ),
        const OffersBanners(),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              itemCount: Menu.length,
              itemBuilder: (context, index) {
                return MenuWidget(
                  menuItem: Menu[index],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
