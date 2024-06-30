import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

class FavoriteItemsWidget extends StatelessWidget {
  final MenuItem menuItem;
  const FavoriteItemsWidget({super.key, required this.menuItem});

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
            menuItem.location,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  menuItem.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${menuItem.price}\$ ",
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
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          //const SizedBox(width: 10,),
        ]));
  }
}
