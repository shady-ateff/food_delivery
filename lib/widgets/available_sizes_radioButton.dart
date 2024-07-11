import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/available_sizes_widget.dart';

class AvailableSizesRadioButton extends StatefulWidget {
  const AvailableSizesRadioButton(
      {super.key, required this.menuItem, this.onSizeChanged});
  final MenuItem menuItem;
  final void Function(int?)?
      onSizeChanged; //to return the index of selection back to page
  @override
  _AvailableSizesRadioButtonState createState() =>
      _AvailableSizesRadioButtonState();
}

class _AvailableSizesRadioButtonState extends State<AvailableSizesRadioButton> {
  int selectedSize = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("size buttonss built");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.menuItem.availableSizes.length,
        (index) {
          return Expanded(
            child: AvailableSizesWidget(
              onPressed: () {
                setState(() {
                  selectedSize = index;
                  widget.onSizeChanged?.call(selectedSize);
                  debugPrint(selectedSize.toString());
                });
              },
              isSelected: index == selectedSize ? true : false,
              size: widget.menuItem.availableSizes.elementAt(index),
            ),
          );
        },
      ),
    );
  }
}
