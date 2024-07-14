import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/cart_item_widget.dart';
import 'package:food_delivery/widgets/favorite_items_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
        SliverAppBar(
          // collapsedHeight: 120,
            automaticallyImplyLeading: true,
            forceElevated: true,
            pinned: true,
            // centerTitle: true,
            // backgroundColor: Colors.white,
            // foregroundColor: Colors.black,
            // shadowColor: Theme.of(context).primaryColor,
            elevation: 1,
            expandedHeight: MediaQuery.of(context).size.height * 0.150,
            //stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              // centerTitle: true,
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
                CartItemWidget(menuItem: menu.elementAtOrNull(0)),
                CartItemWidget(menuItem: menu.elementAtOrNull(1)),
                CartItemWidget(menuItem: menu.elementAtOrNull(2)),
                const SizedBox(height: 500,)
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
