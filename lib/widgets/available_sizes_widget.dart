import 'package:flutter/material.dart';

class AvailableSizesWidget extends StatefulWidget {
  final String size;
  final VoidCallback onPressed;
  final bool isSelected;
  const AvailableSizesWidget(
      {super.key,
      required this.size,
      required this.onPressed,
      this.isSelected = false});

  @override
  State<AvailableSizesWidget> createState() => _AvailableSizesWidgetState();
}

class _AvailableSizesWidgetState extends State<AvailableSizesWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint("size button built");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
        onPressed: () {
          //setState(() {});
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
        child: Text(
          widget.size,
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
      ),
    );
  }
}
