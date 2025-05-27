import 'package:flutter/material.dart';

class TabbarMenu extends StatelessWidget {
  const TabbarMenu({super.key,
    //required this.objectFilter,
    required this.onCategoryChanged,
  });

  //final Map<String, dynamic> objectFilter;
  final ValueChanged<String> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorColor: const Color(0xFF5C4033),
          labelColor: const Color(0xFF5C4033),
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          tabs: const [
            Tab(text: "Coffee"),
            Tab(text: "Non Coffee"),
            Tab(text: "Pastry"),
          ],
          onTap: (value) => onCategoryChanged(
            value == 0 ? "Coffee" : value == 1 ? "Non-Coffee" : "Pastry",
          ),
        ),
      ),
    );
  }
}
