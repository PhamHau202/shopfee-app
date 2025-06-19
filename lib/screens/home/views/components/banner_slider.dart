import 'dart:async';

import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => BannerSliderState();
}

class BannerSliderState extends State<BannerSlider> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<String> banners = [
    'screens/home/slide/slide1.jpeg',
    'screens/home/slide/slide2.jpeg',
    'screens/home/slide/slide3.jpeg',
    'screens/home/slide/slide4.jpeg',
    'screens/home/slide/slide5.jpeg',
    'screens/home/slide/slide6.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    startAutoScroll();
  }

  Timer? timer;
  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex < banners.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset(
                      banners[index],
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: currentIndex == index ? const Color(0xFF5C4033) : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
