
import 'package:flutter/material.dart';
import 'package:newsapp/ui/view/home/home/viewmodel/home_viewmodel.dart';

import 'news.dart';
import 'title.dart';

class TradingWidget extends StatelessWidget {
  const TradingWidget({
    super.key,
    required this.title, required this.imageUrl, required this.id,
  });
  final String title;
  final String imageUrl;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageTittleCard(text: title,click: () {
          Navigator.pushNamed(context, "trending");
        },),
        NewsWidget(
        id: id,
          imagePath:imageUrl,
          country: "Europe",
          title:title,
          authorlogoPath: "logo",
          author: "BBC News")
      ],
    );
  }
}
