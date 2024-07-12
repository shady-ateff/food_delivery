import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final menuItem;
  const CartItemWidget({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: _screenSize.height * 0.15,
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Add a small spacer to the left
              SizedBox(width: constraints.maxWidth * 0.03),

              // Display the menu item image
              Image(
                image: menuItem.location.startsWith("http")
                    ? NetworkImage(menuItem.location)
                    : AssetImage(menuItem.location),
                fit: BoxFit.cover,
                height: constraints.maxWidth * 0.29,
              ),
              SizedBox(width: constraints.maxWidth * 0.03),

              // Display the menu item details
              Expanded(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display the menu item name
                    Text(
                      menuItem.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          // fontSize: constraints.maxWidth * 0.04
                          ),
                    ),

                    // Display the menu item price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: constraints.maxWidth * 0.03),
                            Text(
                              "Deliver in 20 min",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      // fontWeight: FontWeight.bold,
                                      // fontSize: constraints.maxWidth * 0.04
                                      ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${menuItem.price}\$ ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      // fontSize: constraints.maxWidth * 0.04
                                      ),
                            ),
                            Text(
                              "x1",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      // color: Theme.of(context).primaryColor,
                                      // fontWeight: FontWeight.bold,
                                      // fontSize: constraints.maxWidth * 0.04
                                      ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Add a small spacer to the right
              SizedBox(width: constraints.maxWidth * 0.03),

              // Add a small spacer to the right
              SizedBox(width: constraints.maxWidth * 0.03),
            ],
          );
        }),
      ),
    );
  }
}
