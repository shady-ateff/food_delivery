import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_delivery/models/cart_model.dart';

class CartIconRedCircle extends StatefulWidget {
  const CartIconRedCircle({super.key, required this.cartItemCount});
  final int cartItemCount;

  @override
  State<CartIconRedCircle> createState() => _CartIconRedCircleState();
}

class _CartIconRedCircleState extends State<CartIconRedCircle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.topRight,
        children: [
          const Icon(Ionicons.cart_outline),
          Cart.instance.cartList().isNotEmpty
              ? Container(
                  width: 10,
                  height: 14,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: Column(
                    children: [
                      Text(
                        "${Cart.instance.itemCount}",
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ]);
  }
}
