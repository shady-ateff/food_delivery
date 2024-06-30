import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

class MenuWidget extends StatefulWidget {
  final MenuItem menuItem;

  const MenuWidget({Key? key, required this.menuItem});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          //height: screenSize.height ,
          width: double.infinity,
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
                widget.menuItem.location,
                width: screenSize.width * 0.2,
                //height: screenSize.height * 0.1,
                fit: BoxFit.contain,
              ),
              Text(
                textAlign: TextAlign.center,
                widget.menuItem.name,
                style: TextStyle(height: 1,
                  fontSize: screenSize.width*0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${widget.menuItem.price}\$",
                style: TextStyle(fontSize: screenSize.width*0.035, color: Colors.green),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.02),
            child: InkWell(
              onTap: () {
                  setState(() {
                    widget.menuItem.isFavorite = ! widget.menuItem.isFavorite!;
                  });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  //borderRadius: BorderRadius.circular(double.infinity),
                  border:
                      Border.all(color: const Color.fromARGB(170, 208, 28, 37), width: 1.3),
                    shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Icon(
                    size: screenSize.width * 0.04 ,
                    widget.menuItem.isFavorite! ? Icons.favorite : Icons.favorite_border,
                    color: const Color.fromARGB(255, 208, 28, 37),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
