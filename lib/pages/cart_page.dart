import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final VoidCallback onShoppingButtonPressed;
  const CartPage({super.key, required this.onShoppingButtonPressed});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartList = Cart.instance.cartList();
  @override
  Widget build(BuildContext context) {
    return (Cart.instance.items.isNotEmpty)
        ? Scaffold(
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
                    "Cart (${Cart.instance.itemCount} item)",
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
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
                              return CartItemWidget(
                                cartItem: cart.items[index],
                                onRemoveItem: () {
                                  setState(() {
                                    cart.removeItem(cart.items[index]);
                                  });
                                },
                              );
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
                        child: Text(
                            "Total:\n \$${Cart.instance.totalPrice.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("CHECKOUT",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                    const Icon(
                                        Icons.shopping_cart_checkout_rounded),
                                  ]),
                            )),
                      )
                    ]),
              ),
            ),
          )
        : Scaffold(
          appBar: (Navigator.canPop(context))?  AppBar():null,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      EvaIcons.shoppingCartOutline,
                      size: MediaQuery.of(context).size.width * 0.4,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      "No Items in Cart",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                          onPressed: () {
                            widget.onShoppingButtonPressed();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Shopping Now  ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                const Icon(EvaIcons.arrowIosForward)
                              ],
                            ),
                          )),
                    )
                  ]),
            ),
          );
  }
}
