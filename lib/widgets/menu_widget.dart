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
      fit: StackFit.expand,
      children: [
        // The Container displays the menu item details "Can Replace it by Card"
        Card(
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
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              // Display the menu item price
              Text(
                "${widget.menuItem.price}\$",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        // The Align widget displays a favorite icon
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.005),
            child: IconButton(
              onPressed: () {
                setState(() {
                  widget.menuItem.isFavorite = !widget.menuItem.isFavorite!;
                });
              },
              icon: Icon(
                size: screenSize.width * 0.053,
                widget.menuItem.isFavorite!
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
