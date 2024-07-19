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
  double totalPrice = 0.0;
  int itemCount = 0;

  void addItem(CartItem cartItem) {
    // items.add(item);
    final menuItem = cartItem.item;

    double? itemPrice=menuItem.sizePrices[menuItem.availableSizes[cartItem.selectedSize]];
    int inCart =items.lastIndexWhere((i)=> (i.item == cartItem.item )&& (i.selectedSize==cartItem.selectedSize));
    
    if(inCart != -1){
      items.elementAt(inCart).quantity+=cartItem.quantity;
    }
    else {
      items.add(cartItem);
    }
    // totalPrice+=cartItem.item.sizePrices[cartItem.item.availableSizes[selectedSize]];
    totalPrice+= (itemPrice!*cartItem.quantity);
    itemCount+=cartItem.quantity;

    notifyListeners(); // notify listeners that the items list has changed
    debugPrint("$items");
  }

  void removeItem(CartItem cartItem) {
        final menuItem = cartItem.item;
        double? itemPrice=menuItem.sizePrices[menuItem.availableSizes[cartItem.selectedSize]];
    items.remove(cartItem);
    totalPrice-= (itemPrice!*cartItem.quantity);
    itemCount-=cartItem.quantity;
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
