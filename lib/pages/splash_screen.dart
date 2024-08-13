import 'package:flutter/material.dart';

/// A splash screen widget that displays a logo and a circular progress indicator.
///
/// The splash screen is displayed for a duration of 5 seconds, after which it
/// navigates to the '/home' route.
///
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Future.delayed to schedule a callback to be executed after a delay of 5 seconds.
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 208, 28, 37),
              const Color.fromARGB(255, 216, 120, 21),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          )),
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                SizedBox(
                  height: 50,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
