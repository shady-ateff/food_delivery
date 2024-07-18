import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/bottom_order_bar.dart';
import 'package:food_delivery/widgets/item_counter_widget.dart';

class BottomActionBar extends StatefulWidget {
  final MenuItem menuItem;
  final int selectedSize;
  final VoidCallback onAddedToCart;
  const BottomActionBar(
      {super.key,
      required this.menuItem,
      required this.selectedSize,
      required this.onAddedToCart});
  @override
  _BottomActionBarState createState() => _BottomActionBarState();
}

class _BottomActionBarState extends State<BottomActionBar> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    double price = widget.menuItem
        .sizePrices[widget.menuItem.availableSizes[widget.selectedSize]]!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            ItemCounterWidget(
              onCountChange: (count) {
                setState(() {
                  _count = count!;
                });
              },
            ),
            const SizedBox(
              height: 5,
            ),
            BottomOrderBar(
              onButtonPressed: () {
                Cart.instance.addItem(CartItem(
                    selectedSize: widget.selectedSize,
                    item: widget.menuItem,
                    quantity: _count));
                debugPrint("item button pressed");
                widget.onAddedToCart();
              },
              price: price * _count,
            )
          ],
        ),
      ),
    );
  }
}
