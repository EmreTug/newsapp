
import 'package:flutter/material.dart';

import 'custom_text.dart';

class HomePageTittleCard extends StatelessWidget {
  const HomePageTittleCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text, weight: FontWeight.w600, fontSize: 16),
          const CustomText(
            text: "See all",
            fontSize: 14,
            weight: FontWeight.w400,
            color: Color(0xff4E4B66),
          )
        ],
      ),
    );
  }
}
