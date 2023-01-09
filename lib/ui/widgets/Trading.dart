
import 'package:flutter/material.dart';

import 'news.dart';
import 'title.dart';

class TradingWidget extends StatelessWidget {
  const TradingWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageTittleCard(text: title),
        const NewsWidget(
            imagePath: "assets/images/example.png",
            country: "Europe",
            title: "Russian warship: Moskva sinks in Black Sea",
            authorlogoPath: "assets/images/logo.png",
            author: "BBC News"),
      ],
    );
  }
}
