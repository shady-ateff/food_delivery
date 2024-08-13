import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/offer_model.dart';

// OffersBanner widget
class OffersBanner extends StatefulWidget {
  const OffersBanner({super.key});

  @override
  State<OffersBanner> createState() => _OffersBannerState();
}

class _OffersBannerState extends State<OffersBanner> {
  int offerIndex = 0;
  late Timer? timer;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Create a timer to animate the PageView every second
    Future.delayed(Duration.zero, () {
      timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        // Update the offerIndex and animate to the next page
        offerIndex = (offerIndex + 1) % offers.length;
        _pageController.animateToPage(
          offerIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    });
  }


  @override
  void dispose() {
    _pageController.dispose(); // Don't forget to dispose the controller
    timer!.cancel(); // Cancel the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //bool isLandscape =MediaQuery.of(context).orientation == Orientation.landscape;  //if you need to know if device on landscape mode orn ot
    // Return a Stack with a PageView and a column of indicators
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // The PageView with offer images
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: offers
                .map((offer) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          offer.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        // The column of indicators
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                offers.length,
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
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}

// CustomPainter for drawing circles
class CirclePainter extends CustomPainter {
  Color color;

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
