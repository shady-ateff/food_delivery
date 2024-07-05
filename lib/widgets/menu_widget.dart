import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/favorite_icon_button.dart';

// MenuWidget is a StatefulWidget that displays a menu item
class MenuWidget extends StatefulWidget {
  // The menu item to be displayed
  final MenuItem menuItem;

  // Constructor for MenuWidget
  const MenuWidget({super.key, required this.menuItem});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;
    //final textScale = MediaQuery.of(context).textScaler;

    // Return a Stack with a Container and an Align widget
    return Stack(
      fit: StackFit.expand,
      children: [
        // The Container displays the menu item details "Can Replace it by Card"
        Card(
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Display the menu item image
                Image.asset(
                  widget.menuItem.location,
                  width: constraints.maxWidth * 0.55,
                  fit: BoxFit.cover,
                ),
                // Display the menu item name
                Text(
                  textAlign: TextAlign.center,
                  widget.menuItem.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: constraints.maxWidth * 0.08),
                ),
                // Display the menu item price
                Text(
                  "${widget.menuItem.price}\$",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: constraints.maxWidth * 0.07),
                ),
              ],
            );
          }),
        ),
        // The Align widget displays a favorite icon
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.005),
            child: FavoriteIconButton(menuItem: widget.menuItem,)
            ),
          ),
      ],
    );
  }
}
