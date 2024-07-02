import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

// Define the FavoriteItemsWidget class
class FavoriteItemsWidget extends StatefulWidget {
  final MenuItem menuItem;
  final Function(MenuItem) onFavoriteTapped;
  const FavoriteItemsWidget({super.key, required this.menuItem , required this.onFavoriteTapped});

  @override
  State<FavoriteItemsWidget> createState() => _FavoriteItemsWidgetState();
}

// Define the _FavoriteItemsWidgetState class
class _FavoriteItemsWidgetState extends State<FavoriteItemsWidget> {
  @override
  Widget build(BuildContext context) {
    // Return a Card widget with a rounded rectangle shape and elevation
    return Card(
      //elevation: 4,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add a small spacer to the left
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),

          // Display the menu item image
          Image.asset(
            widget.menuItem.location,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.10,
          ),

          // Display the menu item details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Display the menu item name
                Text(
                  widget.menuItem.name,
                  style:Theme.of(context).textTheme.titleLarge!.copyWith(
                  //color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
                ),

                // Display the menu item price
                Text(
                  "${widget.menuItem.price}\$ ",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)
                  ,
                ),
              ],
            ),
          ),

          // Add a small spacer to the right
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),

          // Display a favorite button
          IconButton(
            onPressed: () {
              // Toggle the favorite state when the button is pressed
              setState(() {
                widget.menuItem.isFavorite = !widget.menuItem.isFavorite!;
                widget.onFavoriteTapped(widget.menuItem);
              });
            },
            icon: Icon(
              widget.menuItem.isFavorite!
                  ? Icons.favorite
                  : Icons
                      .favorite_border, //if their is attribute sended by constructor you access it by widget.AtName
              color: Theme.of(context).primaryColor,
            ),
          ),

          // Add a small spacer to the right
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        ],
      ),
    );
  }
}
