import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //App bar shadow
        title: Center(
          child: const Text('Talabak'),
        ),
      ),
      drawer: Drawer(child: ListView()),
      body: ListView(
        shrinkWrap: true,
        //padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 40,
          ),
          Stack(
            children: [
              Container(
                //padding: const EdgeInsets.all(10),
                height: 150,
                child: PageView(
                  //physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                          //to clip image and make it rounded border
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/offer2.jpg',
                            //width: 400,
                            //height: 200,
                           fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(  //to clip image and make it rounded border
                        borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                        'assets/images/offer1.jpg',
                        //width: 400,
                        //height: 200,
                        fit: BoxFit.cover,
                      )),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(painter: CirclePainter(),)
                  ]
                )
              )
            ],
          )
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint= Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
