import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/home/detail/viewmodel/detail_viewmodel.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../base_view.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, this.arguments});
  final Object? arguments;

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailModel>(
      onModelReady: (detailmodel) {
        detailmodel.fetchData(arguments!.toString());
      },
      builder: (context, model, child) {
        return Scaffold(
          bottomNavigationBar:   const BottomNavBar(),
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
          body:FutureBuilder(
            future: model.getData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }
              else if(snapshot.hasData){
                     return Padding(
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
                              onTap: () {
                                Navigator.pushNamed(context, "authorprofile");
                              },
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
                            Image.network(
                              snapshot.data!["photoUrl"],
                              fit: BoxFit.fitWidth,
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                            ),
                            const CustomText(
                                text: "Europe",
                                fontSize: 14,
                                weight: FontWeight.w400,
                                color: Color(0xff4E4B66)),
                             CustomText(
                                text:
                                    snapshot.data!["title"],
                                fontSize: 24,
                                weight: FontWeight.w400),
                             CustomText(
                              text:
                                 snapshot.data!["description"],
                              fontSize: 16,
                              weight: FontWeight.w400,
                              color: Color(0xff4E4B66),
                            ),
                            
                          ],
                        ),
                      ),
                    ),

                    
                     
                    
                  ],
                ),
              );
     
              }
              else{
                print("object");
                return Container();
              }
                }
          ),
        );
      }
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.favorite,
                        size: 24,
                        color: Color(0xffED2E7E),
                      ),
                      CustomText(
                          text: "24.5K", fontSize: 16, weight: FontWeight.w400),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.comment_outlined),
                      ),
                      CustomText(text: "1K", fontSize: 16, weight: FontWeight.w400),
                      Spacer(),
                      Icon(
                        Icons.bookmark,
                        size: 24,
                        color: Color(0xff1877F2),
                      )
                    ],
                  ),
                );
  }
}
