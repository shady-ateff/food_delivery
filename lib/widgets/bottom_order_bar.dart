import 'package:flutter/material.dart';
//import 'package:food_delivery/models/menu_item_model.dart';

class BottomOrderBar extends StatefulWidget {
  //final MenuItem menuItem;
  //final int selectedSize;
  final double price;
  const BottomOrderBar({super.key, required this.price});

  @override
  _BottomOrderBarState createState() => _BottomOrderBarState();
}

class _BottomOrderBarState extends State<BottomOrderBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "\$${widget.price.toStringAsFixed(2)}   ",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Add to Cart",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const Icon(Icons.shopping_cart_checkout)
                    ],
                  ),
                )))
      ],
    );
  }
}
