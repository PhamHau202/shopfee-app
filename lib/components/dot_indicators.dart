import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.totalDots,
  });

   @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalDots, (index) {
        bool isActive = index == currentIndex;
        return Padding(
          padding: EdgeInsets.only(right: index != totalDots - 1 ? 8.w : 0),
          child: Container(
            width: isActive ? 24.w : 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF5B4034) : const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        );
      }),
    );
  }
}
