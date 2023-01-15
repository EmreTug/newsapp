
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
          id: "sd",
            imagePath: "https://firebasestorage.googleapis.com/v0/b/newsapp-9072f.appspot.com/o/files%2FNewsImage%2Fimage_picker1034570809752766955.jpg?alt=media&token=433a7f61-0810-4d86-84c5-6715e169744f",
            country: "Europe",
            title: "Russian warship: Moskva sinks in Black Sea",
            authorlogoPath: "logo",
            author: "BBC News"),
      ],
    );
  }
}
