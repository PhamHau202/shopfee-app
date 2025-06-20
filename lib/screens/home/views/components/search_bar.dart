import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopfee_app/constants/constants.dart';

class SearchBarWidget extends StatelessWidget {
    const SearchBarWidget({super.key,
    required this.onSearchChanged,
  });

  final ValueChanged<String> onSearchChanged;

  OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadious)),
      borderSide: BorderSide(
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                onSearchChanged(value);
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "What would you like to drink ?",
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                filled: false,
                border: secondaryOutlineInputBorder(context),
                enabledBorder: secondaryOutlineInputBorder(context),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Image.asset("/icons/search.png",
                      width: 24,height: 24,)
                ),
              ),
            ),
          ),
          // Bell icon
          const SizedBox(width: 8),
          SizedBox(
            width: 18,
            height: 18,
            child: Icon(
              Icons.notifications_none,
              color: Color(0xFF5C4033),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
