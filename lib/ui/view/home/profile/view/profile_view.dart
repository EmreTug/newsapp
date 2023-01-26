import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/home/profile/viewmodel/profile_viewmodel.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import 'package:newsapp/ui/view/widget/latestcart.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../../widgets/news.dart';
import '../../../base_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileModel>(onModelReady: (profilemodel) {
      profilemodel.fetchNews();
      profilemodel.fetchUserProfile();
    }, builder: (context, model, child) {
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
              FutureBuilder(
                  future: model.getUserProfile(),
                  builder: (context, snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        else {
                                return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data!["image"]),
                              radius: 50,
                            ),
                            Column(
                              children: const [
                                CustomText(
                                    text: "0",
                                    fontSize: 16,
                                    weight: FontWeight.w600),
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
                                    text: "0",
                                    fontSize: 16,
                                    weight: FontWeight.w600),
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
                                    text: "0",
                                    fontSize: 16,
                                    weight: FontWeight.w600),
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
                         Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CustomText(
                              text:snapshot.data!["FullName"],
                              fontSize: 16,
                              weight: FontWeight.w600),
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
                                width: (MediaQuery.of(context).size.width / 2) -
                                    40,
                                child: CustomButtonFullWidth(
                                  text: "Edit Profile",
                                  click: () {
                                    Navigator.pushNamed(context, "editprofile");
                                  },
                                )),
                            SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    40,
                                child: const CustomButtonFullWidth(
                                  text: "Website",
                                )),
                          ],
                        ),
                      ],
                    );
         
                        }
                       }),
              FutureBuilder(
                  future: model.getData(),
                  builder: (context, snapshot) {
                    return Flexible(
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
                              snapshot.data != null
                                  ? ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return NewsWidget(
                                            id: snapshot.data!.docs[index].id,
                                            imagePath: snapshot
                                                .data!.docs[index]["photoUrl"],
                                            country: "Europe",
                                            title: snapshot.data!.docs[index]
                                                ["title"],
                                            authorlogoPath: "logo",
                                            author: "BBC News");
                                      },
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                              snapshot.data != null
                                  ? ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return LatestCard(
                                          id: snapshot.data!.docs[index].id,
                                          country: "country",
                                          authorLogo: "logo",
                                          title: snapshot.data!.docs[index]
                                              ["title"],
                                          authorName: "authorName",
                                          imagePath: snapshot.data!.docs[index]
                                              ["photoUrl"],
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    });
  }
}
