import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key, required this.onFilterChanged});
  final ValueChanged<List<bool>> onFilterChanged;

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final List<bool> _activeStates = [false, false, false, false];

  final List<Map<String, dynamic>> filters = [
    {"label": "Best seller", "icon": Icons.shopping_cart},
    {"label": "Rating 4.5+", "icon": Icons.star},
    {"label": "Price", "icon": Icons.attach_money},
    {"label": "Promotion", "icon": Icons.local_offer},
  ];

  void _onFilterPressed(int index) {
    setState(() {
      _activeStates[index] = !_activeStates[index];
    });

    widget.onFilterChanged(_activeStates);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(filters.length, (index) {
            final bool isActive = _activeStates[index];
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: OutlinedButton.icon(
                onPressed: () => _onFilterPressed(index),
                style: OutlinedButton.styleFrom(
                  backgroundColor: isActive ? const Color(0xFF5C4033) : const Color(0xFFF7F3F0),
                  side: BorderSide(color: isActive ? const Color(0xFF5C4033) : const Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  foregroundColor: isActive ? Colors.white : const Color(0xFF5C4033),
                ),
                icon: Icon(
                  filters[index]["icon"],
                  size: 18,
                  color: isActive ? Colors.white : const Color(0xFF5C4033),
                ),
                label: Text(
                  filters[index]["label"],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isActive ? Colors.white : const Color(0xFF5C4033),
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
