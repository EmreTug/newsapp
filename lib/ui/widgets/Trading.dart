
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
        HomePageTittleCard(text: title,click: () {
          Navigator.pushNamed(context, "trending");
        },),
        const NewsWidget(
            imagePath: "example",
            country: "Europe",
            title: "Russian warship: Moskva sinks in Black Sea",
            authorlogoPath: "logo",
            author: "BBC News"),
      ],
    );
  }
}
