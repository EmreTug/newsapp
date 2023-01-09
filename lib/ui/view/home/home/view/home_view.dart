import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/view/home/home/viewmodel/home_viewmodel.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';
import '../../../../shared/ui_helpers.dart';
import '../../../../widgets/trading.dart';
import '../../../../widgets/title.dart';
import '../../../base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var title = "Trending";
    return BaseView<HomeModel>(builder: (context, model, child) {
      var dsc = "Ukraine's President Zelensky to BBC: Blood money being paid";
      var authorLogo = "logo";
      var authorName = "BBC NEWS";
      var country = "Europe";
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Center(
              child: Text(
            "Logo",
            style: TextStyle(color: Colors.black, fontSize: 15),
          )),
          actions: [
            Center(
              child: Container(
                  margin: const EdgeInsets.only(right: 31),
                  height: 31,
                  width: 31,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 0.3, color: Colors.black)),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 22,
                  )),
            )
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: UIHelper.VerticalSpaceMedium,
                right: UIHelper.VerticalSpaceMedium),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TradingWidget(title: title),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomePageTittleCard(text: "Latest"),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: model.myProducts.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  model.setSelected(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    children: [
                                      CustomText(
                                          text: model.myProducts[index]["name"]
                                              .toString(),
                                          fontSize: 16,
                                          weight: FontWeight.w400),
                                      model.myProducts[index]["isSelected"] ==
                                              true
                                          ? Container(
                                              height: 2,
                                              color: const Color(0xff1877F2),
                                              child: Text(model
                                                  .myProducts[index]["name"]
                                                  .toString()),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        LatestWidget(country: country, authorLogo: authorLogo, title: title, authorName: authorName, imagePath: "latest")
                        ,LatestWidget(country: country, authorLogo: authorLogo, title: title, authorName: authorName, imagePath: "latest")
                        ,LatestWidget(country: country, authorLogo: authorLogo, title: title, authorName: authorName, imagePath: "latest")
                      ,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class LatestWidget extends StatelessWidget {
  const LatestWidget({
    super.key, required this.country, required this.authorLogo, required this.title, required this.authorName, required this.imagePath,
  
  });

  final String country;
  final String authorLogo;
  final String title;
  final String authorName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Image.asset(
              imagePath.getimage(),
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
                          child: Image.asset(authorLogo.getimage()),
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
    );
  }
}
