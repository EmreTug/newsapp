import 'package:flutter/material.dart';
import 'package:newsapp/ui/view/home/home/viewmodel/home_viewmodel.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';
import '../../../../shared/ui_helpers.dart';
import '../../../../widgets/trading.dart';
import '../../../../widgets/title.dart';
import '../../../base_view.dart';
import '../../../widget/latestcart.dart';

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
            _buildActions()
          ],
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
                          child: _buildTopicsList(model),
                        ),
                        LatestCard(
                            country: country,
                            authorLogo: authorLogo,
                            title: title,
                            authorName: authorName,
                            imagePath: "latest"),
                        LatestCard(
                            country: country,
                            authorLogo: authorLogo,
                            title: title,
                            authorName: authorName,
                            imagePath: "latest"),
                        LatestCard(
                            country: country,
                            authorLogo: authorLogo,
                            title: title,
                            authorName: authorName,
                            imagePath: "latest"),
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

  ListView _buildTopicsList(HomeModel model) {
    return ListView.builder(
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
                        );
  }

  Center _buildActions() {
    return Center(
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
          );
  }
}

