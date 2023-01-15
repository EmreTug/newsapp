import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import 'package:newsapp/ui/view/widget/latestcart.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../../widgets/news.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Profile",
          fontSize: 16,
          weight: FontWeight.w400,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "settings");
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 24,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "addnews");
          },
          backgroundColor: const Color(0xff1877F2),
          child: const Icon(Icons.add)),
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
                  children: const [
                    CustomText(
                        text: "2196", fontSize: 16, weight: FontWeight.w600),
                    CustomText(
                      text: "Followers",
                      fontSize: 16,
                      weight: FontWeight.w400,
                      color: Color(0xff4E4B66),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    CustomText(
                        text: "567", fontSize: 16, weight: FontWeight.w600),
                    CustomText(
                      text: "Following",
                      fontSize: 16,
                      weight: FontWeight.w400,
                      color: Color(0xff4E4B66),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    CustomText(
                        text: "21", fontSize: 16, weight: FontWeight.w600),
                    CustomText(
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
                SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 40,
                    child:  CustomButtonFullWidth(
                      text: "Edit Profile",
                      click: () {
                  Navigator.pushNamed(context, "editprofile");
                        
                      },
                    )),
                SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 40,
                    child: const CustomButtonFullWidth(
                      text: "Website",
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
                            id:"",
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
}
