import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filters = [
      {"label": "Filter", "icon": Icons.tune},
      {"label": "Rating 4.5+", "icon": Icons.star},
      {"label": "Price", "icon": Icons.attach_money},
      {"label": "Promo", "icon": Icons.local_offer},
    ];

    return SizedBox(
      height: 44, // chiều cao button
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(filters.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  foregroundColor: const Color(0xFF5C4033),
                ),
                icon: Icon(
                  filters[index]["icon"],
                  size: 18,
                  color: const Color(0xFF5C4033),
                ),
                label: Text(
                  filters[index]["label"],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
