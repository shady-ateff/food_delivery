import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/pages/base_page.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/menu_item_details_pages.dart';
import 'package:food_delivery/pages/profile_page.dart';
import 'package:provider/provider.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized(); //+To ensure that preRunApp Commands excuted
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  // ); //Turn off orientation
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Talabak',
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 208, 28, 37),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
          ),
          //colorSchemeSeed:  const Color.fromARGB(255, 208, 28, 37),
          primaryColor: const Color.fromARGB(255, 208, 28, 37),
          secondaryHeaderColor: const Color.fromARGB(255, 237, 163, 57),
          dividerTheme: const DividerThemeData(
            color: Color.fromARGB(150, 208, 28, 37),
            thickness: 0,
            indent: 50,
            endIndent: 50,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 241, 230),
          cardTheme: const CardTheme(
              color: Colors.white,
              shadowColor: Color.fromARGB(170, 208, 28, 37),
              elevation: 2),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Color.fromARGB(255, 208, 28, 37),
            foregroundColor: Colors.white,
            elevation: 2,
          ),
          listTileTheme: const ListTileThemeData(
              iconColor: Color.fromARGB(255, 208, 28, 37),
              textColor: Colors.black87,
              selectedTileColor: Colors.black),
          fontFamily: "Cairo",
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 208, 28, 37),
              foregroundColor: Colors.white,
              shadowColor: const Color.fromARGB(255, 208, 28, 37),
              elevation: 2.5,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        // home: const BasePage(),
        routes: {
          '/': (context) =>
              const BasePage(), // '/' only bec it defualt page replacing named parameter home:
          '/favorite': (context) => const FavoritePage(),
          '/profile': (context) => const ProfilePage(),
          MenuItemDetailsPages.routeName: (context) =>
              const MenuItemDetailsPages(),
          '/cart': (context) => CartPage(onShoppingButtonPressed: (){
            Navigator.pushNamed(context, '/');
          }),
        },
      ),
    );
  }
}
