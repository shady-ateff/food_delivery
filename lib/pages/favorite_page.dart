import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/pages/menu_item_details_pages.dart';
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
  void dispose() {
    super.dispose();
    debugPrint("Favorite page disposed");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Favorite Page Built");
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Filter the menu items to get the favorite ones
    List favoriteList = menu.where((menuItem) => menuItem.isFavorite!).toList();

    // Check if there are any favorite items
    if (favoriteList.isNotEmpty) {
      // If there are favorite items, display them in a ListView
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (screenSize.width / 650).ceil(),
          childAspectRatio: 4,
          mainAxisSpacing: screenSize.height * 0.01,
          crossAxisSpacing: screenSize.width * 0.01,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
        shrinkWrap: true,
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          // Return a FavoriteItemsWidget for each favorite item
          return InkWell(
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => MenuItemDetailsPages(
                          menuItem: favoriteList.elementAt(index),
                        ),
                      ),
                    )
                    .then((value) => setState(() {
                          debugPrint("home page setState");
                        }));
              },
              child: FavoriteItemsWidget(
                  menuItem: favoriteList.elementAt(index),
                  onFavoriteTapped: (menuItem) {
                    setState(() {
                      favoriteList.remove(menuItem);
                    });
                  }),
            ),
          );
        },
      );
    } else {
      // If there are no favorite items, display a message
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Favorite Items",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: screenSize.width * 0.05),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
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
