import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/favorite_icon_button.dart';

class MenuItemDetailsBanner extends StatelessWidget {
  final MenuItem menuItem;
  const MenuItemDetailsBanner({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Image(
              image: menuItem.location.startsWith("http")
                  ? NetworkImage(menuItem.location)
                  : AssetImage(menuItem.location),
              fit: BoxFit.scaleDown,
              height: 300,
              width: MediaQuery.of(context).size.height * 0.50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //BackButton(),
              //CupertinoNavigationBarBackButton(color: Colors.black87,),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                  ))
            ],
          )
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                menuItem.restaurantName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: const Color.fromARGB(255, 149, 43, 48)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        menuItem.name,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${menuItem.weight} gm",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: const Color.fromARGB(255, 149, 43, 48),
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                  FavoriteIconButton(menuItem: menuItem),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
