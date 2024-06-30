import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:food_delivery/pages/home_page.dart';

class OffersBanners extends StatefulWidget {
  const OffersBanners({super.key});
  @override
  State<OffersBanners> createState() => _OffersBannersState();
}

class _OffersBannersState extends State<OffersBanners> {
  int offerIndex = 0;
  Timer? timer;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      offerIndex = (offerIndex + 1) % 2; //
      _pageController.animateToPage(offerIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15, //get the hight of screen and make container hight relational with screen hight
          child: PageView(
            //physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                offerIndex = index;
              });
              //page = index;
            },
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                    //to clip image and make it rounded border
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
        Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => offerIndex == index
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: CustomPaint(
                            size: const Size(7, 7),
                            painter: CirclePainter(Colors.white60),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: CustomPaint(
                            size: const Size(5, 5),
                            painter: CirclePainter(Colors.black26),
                          ),
                        ),
                )),
            const SizedBox(
              height: 10,
            )
          ],
        )
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  Color color = Colors.black45;

  CirclePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
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
