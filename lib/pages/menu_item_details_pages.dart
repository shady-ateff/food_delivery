import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/widgets/available_sizes_radioButton.dart';
import 'package:food_delivery/widgets/bottom_action_bar.dart';
import 'package:food_delivery/widgets/menu_item_title.dart';

class MenuItemDetailsPages extends StatefulWidget {
  final MenuItem menuItem;

  const MenuItemDetailsPages({super.key, required this.menuItem});

  @override
  State<MenuItemDetailsPages> createState() => _MenuItemDetailsPagesState();
}

class _MenuItemDetailsPagesState extends State<MenuItemDetailsPages> {
  int _selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    debugPrint("Item Page Built");
    //final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: CustomScrollView(//too make Custom style in scrolling
            slivers: [
          //spcific childrens
          SliverAppBar(
            collapsedHeight: 120,
            automaticallyImplyLeading: true,
            forceElevated: true,
            pinned: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shadowColor: Theme.of(context).primaryColor,
            elevation: 1,
            expandedHeight: MediaQuery.of(context).size.height * 0.450,
            //stretch: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CartPage();
                  }));
                },
                icon: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.topRight,
                    children: [
                      const Icon(Icons.shopping_cart),
                      Container(
                        width: 10,
                        height: 14,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child:  Column(
                          children: [
                            Text(
                              "${Cart.items.length}",
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontSize: 9, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ]),
              )
            ],

            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                expandedTitleScale: 1.12,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: widget.menuItem.location.startsWith("http")
                          ? NetworkImage(widget.menuItem.location)
                          : AssetImage(widget.menuItem.location),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.37,
                    ),
                  ],
                ),
                title: MenuItemTitle(menuItem: widget.menuItem)),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      AvailableSizesRadioButton(
                        menuItem: widget.menuItem,
                        onSizeChanged: (size) {
                          debugPrint(
                              "${widget.menuItem.availableSizes[size!]} on page");
                          setState(() {
                            _selectedSize = size;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            itemInfo(
                                "Calories", widget.menuItem.calories, "Kj"),
                            itemInfo("Preparation Time",
                                widget.menuItem.preparationTime, "min"),
                            itemInfo("Weight", widget.menuItem.weight, "gm"),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Text(
                          widget.menuItem.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ]),
              )),
        ]),
        bottomNavigationBar: BottomActionBar(
          menuItem: widget.menuItem,
          selectedSize: _selectedSize,
        ));
  }

  Widget itemInfo(String title, var attribute, String unit) {
    return Column(
      children: [
        Text(
          title,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "$attribute",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              unit,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        )
      ],
    );
  }
}












// SingleChildScrollView(
        //   child:
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     const SizedBox(
        //       height: 2,
        //     ),
        //     Card(
        //         elevation: 5,
        //         //color: Colors.white,
        //         child: SafeArea(child: MenuItemDetailsBanner(menuItem: widget.menuItem))),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //     child: Column(
        //       children: [
        //         AvailableSizesRadioButton(
        //           menuItem: widget.menuItem,
        //           onSizeChanged: (size) {
        //             debugPrint("${widget.menuItem.availableSizes[size!]} on page");
        //             setState(() {
        //               _selectedSize = size;
        //             });
        //           },
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         const Divider(),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //           child: Text(
        //             widget.menuItem.description,
        //             style: Theme.of(context).textTheme.bodyLarge,
        //           ),
        //         ),
        //       ],
        //     ),
        //   )
        // ]),
        // ),