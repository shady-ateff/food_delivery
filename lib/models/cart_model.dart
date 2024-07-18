import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';

class Cart extends ChangeNotifier {
  static final Cart _instance = Cart._internal();
  static Cart get instance {
    return _instance;
  }

  factory Cart() {
    return instance;
  }

  Cart._internal();

  List items = <CartItem>[];

  void addItem(CartItem item) {
    // items.add(item);
    int inCart =items.lastIndexWhere((i)=> (i.item == item.item )&& (i.selectedSize==item.selectedSize));
    
    if(inCart != -1){
      items.elementAt(inCart).quantity+=item.quantity;
    }
    else {
      items.add(item);
    }

    notifyListeners(); // notify listeners that the items list has changed
    debugPrint("$items");
  }

  void removeItem(MenuItem item) {
    items.remove(item);
    notifyListeners(); // notify listeners that the items list has changed
  }

  List cartList() {
    return items;
  }
}

class CartItem {
  final MenuItem item;
  int quantity;
  final int selectedSize;

  CartItem(
      {required this.selectedSize, required this.item, required this.quantity});
}
