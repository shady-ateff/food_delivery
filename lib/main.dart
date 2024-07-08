import 'package:flutter/material.dart';
import 'package:food_delivery/pages/base_page.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized(); //To ensure that preRunApp Commands excuted  
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  // ); //Turn off orientation
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talabak',
      theme: ThemeData(
          //colorSchemeSeed:  const Color.fromARGB(255, 208, 28, 37),
          primaryColor: const Color.fromARGB(255, 208, 28, 37),
          secondaryHeaderColor: const Color.fromARGB(255,237, 163, 57),
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
            selectedTileColor: Colors.black
          ),
          fontFamily: "Cairo",
          useMaterial3: true
          ),

          
      home: const BasePage(),
    );
  }
}
