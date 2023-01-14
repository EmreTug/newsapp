import 'package:flutter/material.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../../widgets/news.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Trending", fontSize: 16, weight: FontWeight.w600,color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIHelper.HorizontalSpaceMedium),
        child: SingleChildScrollView(
          child: Column(
            children:const [
              NewsWidget(
                  imagePath: "example",
                  country: "Europe",
                  title: "Russian warship: Moskva sinks in Black Sea",
                  authorlogoPath: "logo",
                  author: "BBC News"),
                  NewsWidget(
                  imagePath: "example",
                  country: "Europe",
                  title: "Russian warship: Moskva sinks in Black Sea",
                  authorlogoPath: "logo",
                  author: "BBC News"),
                  NewsWidget(
                  imagePath: "example",
                  country: "Europe",
                  title: "Russian warship: Moskva sinks in Black Sea",
                  authorlogoPath: "logo",
                  author: "BBC News"),
             
            ],
          ),
        ),
      ),
    );
  }
}
