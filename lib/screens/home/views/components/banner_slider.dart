import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _banners = [
    'screens/home/slide/slide1.jpeg',
    'screens/home/slide/slide2.jpeg',
    'screens/home/slide/slide3.jpeg',
    'screens/home/slide/slide4.jpeg',
    'screens/home/slide/slide5.jpeg',
    'screens/home/slide/slide6.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
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
                      _banners[index],
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
          children: List.generate(_banners.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: _currentIndex == index ? const Color(0xFF5C4033) : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
