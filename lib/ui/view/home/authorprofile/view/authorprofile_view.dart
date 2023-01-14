import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import 'package:newsapp/ui/view/widget/latestcart.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../../widgets/news.dart';
import '../../../base_view.dart';
import '../viewmodel/authorprofile_viewmodel.dart';

class AuthorProfile extends StatelessWidget {
  const AuthorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthorProfileModel>(onModelReady: (model) {
      model.isFollow=false;
      model.followers=225;
      model.following=250;
      model.news=20;
    },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
           leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ), 
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: Colors.black,
                    size: 24,
                  ))
            ],
          ),
          
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UIHelper.HorizontalSpaceMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("profile".getimage()),
                      radius: 50,
                    ),
                    Column(
                      children:  [
                        CustomText(
                            text: model.followers.toString(), fontSize: 16, weight: FontWeight.w600),
                        const CustomText(
                          text: "Followers",
                          fontSize: 16,
                          weight: FontWeight.w400,
                          color: Color(0xff4E4B66),
                        ),
                      ],
                    ),
                    Column(
                      children:  [
                        CustomText(
                            text: model.following.toString(), fontSize: 16, weight: FontWeight.w600),
                        const CustomText(
                          text: "Following",
                          fontSize: 16,
                          weight: FontWeight.w400,
                          color: Color(0xff4E4B66),
                        ),
                      ],
                    ),
                    Column(
                      children:  [
                        CustomText(
                            text: model.news.toString(), fontSize: 16, weight: FontWeight.w600),
                        const CustomText(
                          text: "News",
                          fontSize: 16,
                          weight: FontWeight.w400,
                          color: Color(0xff4E4B66),
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: CustomText(
                      text: "Wilson Franci", fontSize: 16, weight: FontWeight.w600),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CustomText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    fontSize: 16,
                    weight: FontWeight.w400,
                    color: Color(0xff4E4B66),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   model.isFollow? SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        child:  CustomButtonFullWidth(
                          text: "Following",click: () {
                            model.setFollow();
                            
                          },
                        )): SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        child:  CustomButtonFullWidth(
                          text: "Follow",click: () {
                            model.setFollow();
                          },
                        )),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        child:  CustomButtonFullWidth(
                          text: "Website",
                          click: () {
                            
                          },
                        )),
                  ],
                ),
                Flexible(
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 10,
                        bottom: const TabBar(
                          labelColor: Colors.black,
                          isScrollable: true,
                          tabs: [
                            Tab(
                              text: "News",
                            ),
                            Tab(
                              text: "Recent",
                            ),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                         
                        ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const NewsWidget(
                imagePath: "example",
                country: "Europe",
                title: "Russian warship: Moskva sinks in Black Sea",
                authorlogoPath: "logo",
                author: "BBC News");
                            },
                          ),
                                   ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const LatestCard(
                                  country: "country",
                                  authorLogo: "logo",
                                  title: "title",
                                  authorName: "authorName",
                                  imagePath: "latest");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
