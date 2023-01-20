import 'package:flutter/material.dart';
import 'package:newsapp/core/enum/viewstate.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/home/explore/viewmodel/explore_viewmodel.dart';
import 'package:newsapp/ui/view/widget/topiccard.dart';
import 'package:newsapp/ui/widgets/news.dart';

import '../../../../widgets/custom_text.dart';
import '../../../../widgets/title.dart';
import '../../../base_view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreModel>(onModelReady: (exploremodel) async {
      exploremodel.fetchNews();
      await exploremodel.fetchTopicList();
    }, builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: "Explore",
            fontSize: 16,
            weight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: UIHelper.HorizontalSpaceMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageTittleCard(
                text: "Topic",
                click: () {
                  Navigator.pushNamed(context, "topic");
                },
              ),
              //searchbar
              model.state == ViewState.Idle
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TopicCard(
                          title: model.myProducts[index]["name"],
                          desc: model.myProducts[index]["description"],
                          image: model.myProducts[index]["image"],
                        );
                      },
                    )
                  : Container(),

              const CustomText(
                  text: "Popular Topic", weight: FontWeight.w600, fontSize: 16),
              FutureBuilder(
                future: model.data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return NewsWidget(
                            id: snapshot.data!.docs[index].id,
                            imagePath: snapshot.data!.docs[index]["photoUrl"],
                            country: "country",
                            title: snapshot.data!.docs[index]["title"],
                            authorlogoPath: "logo",
                            author: "author");
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
