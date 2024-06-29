import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

class MenuWidget extends StatelessWidget {
  final MenuItem menuItem;

  MenuWidget({Key? key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            menuItem.location,
            //width: 100,
            height: 95,
            fit: BoxFit.cover,
          ),
          Text(
            textAlign: TextAlign.center,
            menuItem.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            "${menuItem.price}\$",
            style: const TextStyle(fontSize: 18, color: Colors.green),
          ),
        ],
      ),
    );
  }

}
