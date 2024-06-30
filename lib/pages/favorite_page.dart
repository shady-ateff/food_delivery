import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/favorite_items_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20 ,horizontal: 7),
      shrinkWrap: true,
      itemCount: Menu.where((menuItem)=> menuItem.isFavorite == true).length,
      itemBuilder: (context ,index) {
        return FavoriteItemsWidget(menuItem: Menu.where((menuItem)=> menuItem.isFavorite == true).elementAt(index));

      },
      );
  }
}

// Column(
//       children: [
//         // Container(
//         //     margin: const EdgeInsets.all(20),
//         //     decoration: BoxDecoration(
//         //       borderRadius: BorderRadius.circular(20),
//         //       color: Colors.white,
//         //     ),
//         //     //height: MediaQuery.of(context).size.height * 0.15,
//         //     child: Row(
//         //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //         children: [
//         //           Image.asset(Menu[0].location,
//         //               fit: BoxFit.cover,
//         //               height: MediaQuery.of(context).size.height * 0.10),
//         //           Column(
//         //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //             crossAxisAlignment: CrossAxisAlignment.end,
//         //             children: [
//         //               Text(
//         //                 Menu[0].name,
//         //                 style: const TextStyle(
//         //                   fontWeight: FontWeight.w600,
//         //                   fontSize: 20,
//         //                 ),
//         //               ),
//         //               Row(
//         //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //                 //crossAxisAlignment: CrossAxisAlignment.end,
//         //                 children: [
//         //                   Text(
//         //                     "${Menu[0].price}\$ ",
//         //                     style: const TextStyle(
//         //                       color: Color.fromARGB(255, 208, 28, 37),
//         //                       fontSize: 17,
//         //                       fontWeight: FontWeight.w500,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ],
//         //           ),
//         //           //const SizedBox(width: 10,),
//         //           const Padding(
//         //             padding: EdgeInsets.all(10.0),
//         //             child: Icon(Icons.favorite),
//         //           ),
//         //           //const SizedBox(width: 10,),
//         //         ])),
//         // ],
    
//     ])