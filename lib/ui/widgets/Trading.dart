
import 'package:flutter/material.dart';
import 'package:newsapp/ui/view/home/home/viewmodel/home_viewmodel.dart';

import 'news.dart';
import 'title.dart';

class TradingWidget extends StatelessWidget {
  const TradingWidget({
    super.key,
    required this.title, required this.model,
  });
  final HomeModel model;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageTittleCard(text: title,click: () {
          Navigator.pushNamed(context, "trending");
        },),
        FutureBuilder(
          future: model.data,
          builder: (context, snapshot) {
          return  NewsWidget(
          id: snapshot.data!.docs.first.id,
            imagePath:snapshot.data!.docs.first["photoUrl"],
            country: "Europe",
            title:snapshot.data!.docs.first["title"],
            authorlogoPath: "logo",
            author: "BBC News");
        },)
      ],
    );
  }
}
