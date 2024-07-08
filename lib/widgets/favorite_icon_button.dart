import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

class FavoriteIconButton extends StatefulWidget {
  final MenuItem menuItem;
  const FavoriteIconButton({ super.key, required this.menuItem });

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
              onPressed: () {
                setState(() {
                  widget.menuItem.isFavorite = !widget.menuItem.isFavorite!;
                });
              },
              icon: Icon(
                //size: screenSize.width * 0.053,
                widget.menuItem.isFavorite!
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Theme.of(context).primaryColor,
              ),
            );
  }
}