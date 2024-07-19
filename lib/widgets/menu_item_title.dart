import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/favorite_icon_button.dart';

class MenuItemTitle extends StatelessWidget {
  final MenuItem menuItem;
  const MenuItemTitle({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            menuItem.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                          ),
                          Text(
                            menuItem.restaurantName,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 149, 43, 48)),
                          ),
                        ],
                      ),
                    ),
                    FavoriteIconButton(menuItem: menuItem),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
