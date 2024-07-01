import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/menu_widget.dart';
import 'package:food_delivery/widgets/offers_banner.dart';

// HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> color = [Colors.black45];

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Return a ListView with three children: a spacer, the OffersBanner, and a GridView
    return ListView(
      children: [
        // Spacer to add some space at the top
        SizedBox(height: screenSize.height * 0.03),

        // The OffersBanner widget
        const OffersBanner(),

        // Another spacer to add some space between the banner and the grid
        SizedBox(height: screenSize.height * 0.03),

        // A GridView with MenuWidgets
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            // Disable scrolling on the GridView, so the ListView scrolls instead
            physics: const NeverScrollableScrollPhysics(),
            // Shrink the GridView to fit its children
            shrinkWrap: true,
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
      ],
    );
  }
}