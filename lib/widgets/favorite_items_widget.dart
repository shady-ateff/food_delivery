import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

class FavoriteItemsWidget extends StatefulWidget {
  final MenuItem menuItem;
  const FavoriteItemsWidget({super.key, required this.menuItem});

  @override
  State<FavoriteItemsWidget> createState() => _FavoriteItemsWidgetState();
}

class _FavoriteItemsWidgetState extends State<FavoriteItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        //margin: const EdgeInsets.symmetric(vertical: 7 ,horizontal: 20),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Image.asset(
            widget.menuItem.location,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.menuItem.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${widget.menuItem.price}\$ ",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 208, 28, 37),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: InkWell(
          //     onTap: () {
          //       setState(() {
          //         widget.menuItem.isFavorite = !widget.menuItem.isFavorite!;
          //       });
          //     },
          //     child: const Icon(
          //       Icons.favorite,
          //       color: Color.fromARGB(255, 232, 34, 8),
          //     ),
          //   ),
          // ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.menuItem.isFavorite = !widget.menuItem.isFavorite!;
              });
            },
            icon: Icon(
              widget.menuItem.isFavorite!? Icons.favorite :Icons.favorite_border,
              color: const Color.fromARGB(255, 232, 34, 8),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          //const SizedBox(width: 10,),
        ]));
  }
}
