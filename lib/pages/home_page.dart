import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0 ,  //App bar shadow
        title: Center(
          child: const Text('Talabak'),
        ),
      ),
      drawer: Drawer(
        child: ListView()
      ),
      body: Text("data"),
    );
  }
}