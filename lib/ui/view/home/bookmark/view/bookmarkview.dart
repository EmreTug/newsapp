import 'package:flutter/material.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/home/home/view/home_view.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../widget/latestcart.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(
          text: "Bookmark",
          fontSize: 16,
          weight: FontWeight.w400,
          color: Colors.black,
        ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: UIHelper.HorizontalSpaceMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
             
              //searchbar
              LatestCard(
                  country: "USA",
                  authorLogo: "logo",
                  title: "Russian warship: Moskva sinks in Black Sea",
                  authorName: "CNBC",
                  imagePath: "latest"),
              SizedBox(
                height: 10,
              ),

              LatestCard(
                  country: "USA",
                  authorLogo: "logo",
                  title:
                      "Ukraine's President Zelensky to BBC: Blood money being paid...",
                  authorName: "CNBC",
                  imagePath: "latest"),
              SizedBox(
                height: 10,
              ),

              LatestCard(
                  country: "USA",
                  authorLogo: "logo",
                  title:
                      "Her train broke down. Her phone died. And then she met her...",
                  authorName: "CNBC",
                  imagePath: "latest"),
              SizedBox(
                height: 10,
              ),

              LatestCard(
                  country: "USA",
                  authorLogo: "logo",
                  title: "Russian warship: Moskva sinks in Black Sea",
                  authorName: "CNBC",
                  imagePath: "latest"),
              SizedBox(
                height: 10,
              ),
              LatestCard(
                  country: "USA",
                  authorLogo: "logo",
                  title: "Russian warship: Moskva sinks in Black Sea",
                  authorName: "CNBC",
                  imagePath: "latest"),
              SizedBox(
                height: 10,
              ),
              LatestCard(
                  country: "USA",
                  authorLogo: "logo",
                  title: "Russian warship: Moskva sinks in Black Sea",
                  authorName: "CNBC",
                  imagePath: "latest"),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
