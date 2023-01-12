import 'package:flutter/material.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/widget/topiccard.dart';
import 'package:newsapp/ui/widgets/news.dart';

import '../../../../widgets/custom_text.dart';
import '../../../../widgets/title.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: UIHelper.HorizontalSpaceMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomText(
              text: "Explore",
              fontSize: 32,
              weight: FontWeight.w700,
              color: Colors.black,
            ),
            HomePageTittleCard(text: "Topic"),
            //searchbar
            TopicCard(),
            TopicCard(),
            TopicCard(),
          CustomText(text: "Popular Topic", weight: FontWeight.w600, fontSize: 16),
          NewsWidget(imagePath: "example", country: "country", title: "title", authorlogoPath: "logo", author: "author")

          ],
        ),
      ),
    );
  }
}
