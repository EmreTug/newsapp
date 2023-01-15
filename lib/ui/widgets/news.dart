import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';

import 'custom_text.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.imagePath,
    required this.country,
    required this.title,
    required this.authorlogoPath,
    required this.author,
  });
  final String imagePath;
  final String country;
  final String title;
  final String authorlogoPath;
  final String author;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "detail");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Center(
              child: Image.network(imagePath,
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  fit: BoxFit.fitWidth),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: CustomText(
              text: country,
              fontSize: 13,
              weight: FontWeight.w400,
              color: const Color(0xff4E4B66),
            ),
          ),
          CustomText(
            text: title,
            fontSize: 16,
            weight: FontWeight.w400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(authorlogoPath.getimage()),
                  ),
                  CustomText(
                    text: author,
                    fontSize: 13,
                    weight: FontWeight.w600,
                    color: const Color(0xff4E4B66),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          )
        ],
      ),
    );
  }
}
