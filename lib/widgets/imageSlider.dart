import 'package:exporter/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlider;
  ImageSlider({super.key, required this.onChange, required this.currentSlider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  "slider.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "image1.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "slider3.png",
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
            bottom: 10,
            // left: 230,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: currentSlider == index ? 15 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentSlider == index
                                ? kprimaryColor
                                : Colors.grey,
                            // border: Border.all(color: Colors.black)
                          ),
                        )),
              ),
            )),
      ],
    );
  }
}
