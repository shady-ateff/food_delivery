import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/pages/menu_item_details_pages.dart';
import 'package:food_delivery/widgets/menu_item_filter.dart';
import 'package:food_delivery/widgets/menu_widget.dart';
import 'package:food_delivery/widgets/offers_banner.dart';

// HomePage widget
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = -1;

  @override
  void initState() {
    super.initState();
    debugPrint("home page initState");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("home page disposed");
  }

  @override
  Widget build(BuildContext context) {
    final catiegories = MenuItem.getCategories(menu);

    debugPrint("sel Cat $selectedCategory");
    final List filteredMenu = (selectedCategory != -1)
        ? menu
            .where((menuItem) =>
                menuItem.category == catiegories.elementAt(selectedCategory))
            .toList()
        : menu;
    debugPrint("home page Builded");
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Return a ListView with three children: a spacer, the OffersBanner, and a GridView
    return ListView(
      children: [
        // Spacer to add some space at the top
        SizedBox(height: screenSize.height * 0.03),

        // The OffersBanner widget
        const OffersBanner(),

        // Another spacer to add some space between the banner and the grid
        SizedBox(height: screenSize.height * 0.01),

         MenuItemFilter(
          onChangeSelection: (buttonIndex) {
            setState(() {
              if (selectedCategory != buttonIndex)
                selectedCategory = buttonIndex!;
              else
                {selectedCategory = -1;}
              debugPrint("category is $selectedCategory");
            });
          },
          selection: selectedCategory,
        ),

        SizedBox(height: screenSize.height * 0.02),

        // A GridView with MenuWidgets
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            // Disable scrolling on the GridView, so the ListView scrolls instead
            physics: const NeverScrollableScrollPhysics(),
            // Shrink the GridView to fit its children
            shrinkWrap: true,
            itemCount: filteredMenu.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(MenuItemDetailsPages.routeName,
                          arguments: filteredMenu[index])
                      .then((value) => setState(() {
                            debugPrint("home page setState");
                          }));

                  /* in case you need to pass more than one arg you can pass it as map<string , dynamic> and access it as map (map['arg name'])
                  but the better way "clean arch" is creating a model "class" that contain all args you need to send instead */
                  // Navigator.of(context).pushNamed('/menu-item-details',
                  //     arguments: {
                  //       'item': menu[index],

                  //     }).then((value) => setState(() {
                  //       debugPrint("home page setState");
                  //     }));

                  // == Navigator.push(context,MaterialPageRoute(
                  //     builder: (context) => const MenuItemDetailsPages()));
                },
                child: MenuWidget(
                  menuItem: filteredMenu[index],
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (screenSize.width / 350).ceil(),
              mainAxisSpacing: screenSize.height * 0.01,
              crossAxisSpacing: screenSize.width * 0.01,
            ),
          ),
        ),
      ],
    );
  }
}
