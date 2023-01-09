import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';
import '../../shared/ui_helpers.dart';
import '../../widgets/Trading.dart';
import '../../widgets/title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var title = "Trending";
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
                  padding: const EdgeInsets.only(top:16.0),
                  child: Column(
                    children: [
                      const HomePageTittleCard(text: "Latest"),
                      Container(
                        height: 300,
                        width: 2000,
                        child: ListView.builder(
                          itemCount: 100,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: EdgeInsets.only(right:10.0),
                              child: Container(
                                
                                child: Column(children: [
                                  const CustomText(text: "text", fontSize: 16, weight: FontWeight.w400),
                                  Container(height: 2,color: const Color(0xff1877F2),)
                                ],),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
