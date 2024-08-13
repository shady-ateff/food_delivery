// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/pages/base_page.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/menu_item_details_pages.dart';
import 'package:food_delivery/pages/profile_page.dart';
import 'package:food_delivery/pages/splash_screen.dart';
import 'package:provider/provider.dart';
void main() {
  // Ensure that pre-run app commands are executed
  // WidgetsFlutterBinding.ensureInitialized();
  // Turn off orientation
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  // );
  // Run the app with a ChangeNotifierProvider for the Cart model

  runApp(
    MyApp(),
  );
}

// Define the MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Return a MultiProvider widget with a single provider for the Cart model
    return MultiProvider(
      providers: [
        //we're telling Flutter to automatically notify the widgets that depend on the Cart model whenever the model changes.
        ChangeNotifierProvider(create: (context) => Cart()),
        ],
      // Define the material app
      child: MaterialApp(
        // Disable the debug banner
        debugShowCheckedModeBanner: false,
        // Set the title of the app
        title: 'Talabak',
        // Define the theme of the app
        theme: ThemeData(
          // Bottom navigation bar theme
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 208, 28, 37),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
          ),
          // Primary color of the app
          primaryColor: const Color.fromARGB(255, 208, 28, 37),
          // Secondary header color
          secondaryHeaderColor: const Color.fromARGB(255, 216, 120, 21),
          // Divider theme
          dividerTheme: const DividerThemeData(
            color: Color.fromARGB(150, 208, 28, 37),
            thickness: 0,
            indent: 50,
            endIndent: 50,
          ),
          // Scaffold background color
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 241, 230),
          // Card theme
          cardTheme: const CardTheme(
              color: Colors.white,
              shadowColor: Color.fromARGB(170, 208, 28, 37),
              elevation: 2),
          // App bar theme
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Color.fromARGB(255, 208, 28, 37),
            foregroundColor: Colors.white,
            elevation: 2,
          ),
          // List tile theme
          listTileTheme: const ListTileThemeData(
              iconColor: Color.fromARGB(255, 208, 28, 37),
              textColor: Colors.black87,
              selectedTileColor: Colors.black),
          // Font family
          fontFamily: "Cairo",
          // Use Material 3
          useMaterial3: true,
          // Elevated button theme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 208, 28, 37),
              foregroundColor: Colors.white,
              shadowColor: const Color.fromARGB(255, 208, 28, 37),
              elevation: 2.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),

        home: SplashScreen(),
        // Define the routes for the app
        routes: {
          // '/splash': (context) => SplashScreen(),
          '/home': (context) => const BasePage(), // Default route
          '/favorite': (context) => const FavoritePage(),
          '/profile': (context) => const ProfilePage(),
          MenuItemDetailsPages.routeName: (context) =>
              const MenuItemDetailsPages(),
          '/cart': (context) => CartPage(
                onShoppingButtonPressed: () {
                  // Navigate back to the base page when the shopping button is pressed
                  Navigator.pushNamed(context, '/');
                },
              ),
        },
      ),
    );
  }
}
