import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/cart_item_widget.dart';
import 'package:food_delivery/widgets/favorite_items_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartList = Cart.instance.cartList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          // collapsedHeight: 120,
          automaticallyImplyLeading: true,
          forceElevated: true,
          pinned: true,
          elevation: 1,
          expandedHeight: MediaQuery.of(context).size.height * 0.150,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            title: Text(
              "Cart (1 item)",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                const SizedBox(
                  height: 3,
                ),
                Card(
                  elevation: 0,
                  color: Colors.white60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Deliver to Your Location",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.pin_drop)
                    ],
                  ),
                ),
                Consumer<Cart>(builder: (context, cart, child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(cartItem: cart.items[index]);
                      });
                }),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ])),
        )
      ]),
      bottomNavigationBar: Card(
        color: Colors.white,
        //height: MediaQuery.sizeOf(context).height * 0.12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Total:\n \$1000",
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("CHECKOUT",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                              const Icon(Icons.shopping_cart_checkout_rounded),
                            ]),
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
