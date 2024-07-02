class MenuItem {
final String name;
final String location;
final double price;
bool? isFavorite;

  MenuItem({required this.name, required this.location, required this.price , this.isFavorite = false});

}

List<MenuItem> menu =[
  MenuItem(name: "Original Beef Burger", location: "assets/images/item (1).png", price: 2.99 ),
  MenuItem(name: "Beef Burger & Fries", location: "assets/images/item (2).png", price: 3.49),
  MenuItem(name: "Chicken Burger\nExtra Ranch", location: "assets/images/item (3).png", price: 3.99),
  MenuItem(name: "Chicken Roll", location: "assets/images/item (4).png", price: 2.99),
  MenuItem(name: "Zo Beef Burger", location: "assets/images/item (5).png", price: 3.99),
  MenuItem(name: "Super Beef Burger", location: "assets/images/item (6).png", price: 4.99),
  MenuItem(name: "Dummy Beef Burger", location: "assets/images/item (6).png", price: 4.99),
  MenuItem(name: "Dummy Beef Burger", location: "assets/images/item (6).png", price: 4.99),
  MenuItem(name: "Dummy Beef Burger", location: "assets/images/item (6).png", price: 4.99),
  //MenuItem(name: "Dummy Beef Burger", location: "assets/images/item (6).png", price: 4.99),
];
