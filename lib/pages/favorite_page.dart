import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/favorite_items_widget.dart';

// Define the FavoritePage widget
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  FavoritePageState createState() => FavoritePageState();
}

// Define the FavoritePageState class
class FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Filter the menu items to get the favorite ones
    List favoriteList = menu.where((menuItem) => menuItem.isFavorite!).toList();

    // Check if there are any favorite items
    if (favoriteList.isNotEmpty) {
      // If there are favorite items, display them in a ListView
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
        shrinkWrap: true,
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          // Return a FavoriteItemsWidget for each favorite item
          return FavoriteItemsWidget(
              menuItem: favoriteList.elementAt(index),
              onFavoriteTapped: (menuItem) {
                setState(() {
                  favoriteList.remove(menuItem);
                });
              });
        },
      );
    } else {
      // If there are no favorite items, display a message
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Favorite Items",
            style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
          ),
          SizedBox(height: screenSize.height * 0.01,),
          Icon(
            size: screenSize.width * 0.06,
            Icons.favorite_border_rounded,
            color: Theme.of(context).primaryColor,
          )
        ],
      );
    }
  }
}
