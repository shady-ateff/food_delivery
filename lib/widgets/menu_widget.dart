import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

// MenuWidget is a StatefulWidget that displays a menu item
class MenuWidget extends StatefulWidget {
  // The menu item to be displayed
  final MenuItem menuItem;

  // Constructor for MenuWidget
  const MenuWidget({Key? key, required this.menuItem}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Return a Stack with a Container and an Align widget
    return Stack(
      children: [
        // The Container displays the menu item details "Can Replace it by Card"
        Container(
          // Set the width to infinity to fill the available space
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Display the menu item image
              Image.asset(
                widget.menuItem.location,
                width: screenSize.width * 0.2,
                //fit: BoxFit.contain,
              ),
              // Display the menu item name
              Text(
                textAlign: TextAlign.center,
                widget.menuItem.name,
                style: TextStyle(
                  height: 1,
                  fontSize: screenSize.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Display the menu item price
              Text(
                "${widget.menuItem.price}\$",
                style: TextStyle(
                    fontSize: screenSize.width * 0.035, color: Colors.green),
              ),
            ],
          ),
        ),
        // The Align widget displays a favorite icon
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.02),
            child: InkWell(
              onTap: () {
                // Toggle the favorite status of the menu item
                setState(() {
                  widget.menuItem.isFavorite = !widget.menuItem.isFavorite!;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(
                    color: const Color.fromARGB(170, 208, 28, 37),
                    width: 1.3,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Icon(
                    size: screenSize.width * 0.04,
                    widget.menuItem.isFavorite!
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: const Color.fromARGB(255, 208, 28, 37),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
