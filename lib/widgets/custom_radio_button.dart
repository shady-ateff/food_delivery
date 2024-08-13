import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  bool containIcon =false;
  String? iconName;
  CustomRadioButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isSelected = false,
      this.containIcon =false,
      this.iconName
      });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    debugPrint("size button built");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: widget.isSelected
            ? ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shadowColor: Theme.of(context).primaryColor,
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))
            : ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shadowColor: Theme.of(context).primaryColor,
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.containIcon? Container(
                height: 30,
                child: Image.asset(
                  "assets/images/${widget.iconName}.png",
                  fit: BoxFit.fitHeight,
                  color: widget.isSelected?  Colors.white : Colors.black,
                ),
              ):SizedBox(height: 0,),
          
              Text(
                widget.text,
                style: widget.isSelected
                    ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                    : Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
