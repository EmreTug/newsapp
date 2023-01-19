import 'package:flutter/material.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/home/bookmark/viewmodel/bookmark_viewmodel.dart';
import 'package:newsapp/ui/view/home/home/view/home_view.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../base_view.dart';
import '../../../widget/latestcart.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BookMarkModel>(onModelReady: (bookmarkmodel) async {
      bookmarkmodel.fetchNews();
    }, builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: "Bookmark",
            fontSize: 16,
            weight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIHelper.HorizontalSpaceMedium),
            child: FutureBuilder(
                future: model.data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState==ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                    
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                      return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      //searchbar
                      LatestCard(
                          id: snapshot.data!.docs[index].id,
                          country: "USA",
                          authorLogo: "logo",
                          title: snapshot.data!.docs[index]["title"],
                          authorName: "CNBC",
                          imagePath:snapshot.data!.docs[index]["photoUrl"]),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                    },);
                  }
                  
                }),
          ),
        ),
      );
    });
  }
}
