import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';

import '../../widgets/custom_text.dart';

class LatestCard extends StatelessWidget {
  const LatestCard({
    super.key,

    required this.country,
    required this.authorLogo,
    required this.title,
    required this.authorName,
    required this.imagePath, required this.id,
  });
  final String id;
  final String country;
  final String authorLogo;
  final String title;
  final String authorName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "detail",arguments: id);
      },
      child: Container(
        height: 112,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Image.network(
                imagePath,
                height: 96,
                width: 96,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * (7 / 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: country,
                      fontSize: 13,
                      weight: FontWeight.w400,
                      color: const Color(0xff4E4B66)),
                  CustomText(
                      text: title,
                      fontSize: 16,
                      weight: FontWeight.w400,
                      maxLines: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(authorLogo.getimage(),height:25,),
                          ),
                          CustomText(
                            text: authorName,
                            fontSize: 13,
                            weight: FontWeight.w600,
                            color: const Color(0xff4E4B66),
                          ),
                        ],
                      ),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
