import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/custom_radio_button.dart';

class MenuItemFilter extends StatefulWidget {
  MenuItemFilter({super.key, this.onChangeSelection, this.selection});
  final void Function(int?)?
      onChangeSelection; //to return the index of selection back to page
  int? selection;
  @override
  _MenuItemFilterState createState() => _MenuItemFilterState();
}

class _MenuItemFilterState extends State<MenuItemFilter> {
  int selectedButton = -1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedButton = widget.selection != null ? widget.selection! : -1;
    debugPrint("Category buttonss built");
    final catiegories = MenuItem.getCategories(menu);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        catiegories.length,
        (index) {
          return Container(
            child: CustomRadioButton(
              containIcon: true,
              iconName: catiegories.elementAt(index),
              text: catiegories.elementAt(index),
              onPressed: () {
                setState(() {
                  selectedButton = index;
                  widget.onChangeSelection?.call(selectedButton);
                  debugPrint(selectedButton.toString());
                });
              },
              isSelected: index == selectedButton ? true : false,
            ),
          );
        },
      ),
    );
  }
}
