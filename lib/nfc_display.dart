import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NfcDisplay extends StatefulWidget {
  @override
  _NfcDisplayState createState() => _NfcDisplayState();
}

class _NfcDisplayState extends State<NfcDisplay> {

  double svgSize = 100.0;

  Widget _carouselItem(String svgName, String subtitle) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset("assets/svgs/" + svgName + ".svg", height: svgSize, width: svgSize),
      SizedBox(height: 10),
      Text(subtitle, style: TextStyle(fontSize: 16)),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Du har opsparet",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("40 kr.",
                        style: TextStyle(fontSize: 75),
                      ),
                      SizedBox(height: 15),
                      Text("Indløs beløbet i en af boderne på festivalen", style: TextStyle(fontSize: 16))
                  ]
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 0.4
                      ),
                      items: [
                        _carouselItem("pizza", "50 kr."),
                        _carouselItem("ice-cream", "30 kr."),
                        _carouselItem("hamburger", "45 kr."),
                        _carouselItem("drink", "40 kr."),
                        _carouselItem("coffee", "30 kr."),
                      ]
                    ),
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}
