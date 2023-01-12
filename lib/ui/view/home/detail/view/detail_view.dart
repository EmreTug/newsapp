import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Icon(
            Icons.share_outlined,
            color: Colors.black,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIHelper.HorizontalSpaceMedium),
        child: Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        "logo".getimage(),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: const CustomText(
                          text: "BBC News",
                          fontSize: 16,
                          weight: FontWeight.w600),
                      subtitle: const CustomText(
                        text: "14m ago",
                        fontSize: 14,
                        weight: FontWeight.w400,
                        color: Color(0xff4E4B66),
                      ),
                      trailing:
                          const CustomButton(text: "Following", height: 35),
                    ),
                    Image.asset(
                      "example".getimage(),
                      fit: BoxFit.fitWidth,
                    ),
                    const CustomText(
                        text: "Europe",
                        fontSize: 14,
                        weight: FontWeight.w400,
                        color: Color(0xff4E4B66)),
                    const CustomText(
                        text:
                            "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
                        fontSize: 24,
                        weight: FontWeight.w400),
                    const CustomText(
                      text:
                          "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of 'earning their money in other people's blood'.In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (326bn) this year.",
                      fontSize: 16,
                      weight: FontWeight.w400,
                      color: Color(0xff4E4B66),
                    ),
                    const CustomText(
                      text:
                          "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of 'earning their money in other people's blood'.In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (326bn) this year.",
                      fontSize: 16,
                      weight: FontWeight.w400,
                      color: Color(0xff4E4B66),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 75,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:const [
                  Icon(Icons.favorite,size: 24,color: Color(0xffED2E7E),),
                  CustomText(
                      text: "24.5K", fontSize: 16, weight: FontWeight.w400),
                  Padding(
                    padding:  EdgeInsets.only(left: 10),
                    child: Icon(Icons.comment_outlined),
                  ),
                  CustomText(
                      text: "1K", fontSize: 16, weight: FontWeight.w400),
                  Spacer(),
                  Icon(
                    Icons.bookmark,
                    size: 24,
                    color: Color(0xff1877F2),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
