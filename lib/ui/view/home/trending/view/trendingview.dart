import 'package:flutter/material.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/home/trending/viewmodel/trending_viewmodel.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../../widgets/news.dart';
import '../../../base_view.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TrendingModel>(
      onModelReady: (trendingmodel) async{
        trendingmodel.fetchNews();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const CustomText(text: "Trending", fontSize: 16, weight: FontWeight.w600,color: Colors.black),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIHelper.HorizontalSpaceMedium),
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: model.newsSnapshot,

                builder: (context, snapshot) {
               if(snapshot.data!=null&&snapshot.data!.docs.isNotEmpty){
                 return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                  return NewsWidget(
                    id:snapshot.data!.docs[index].id,
                      imagePath: snapshot.data!.docs[index]["photoUrl"],
                      country: "Europe",
                      title:snapshot.data!.docs[index]["title"],
                      authorlogoPath: "logo",
                      author: "BBC News");
                },);

               }
               else if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
               }
               else if(snapshot.data!.docs.isEmpty){
                return const Center(child: Text("Haber Bulunmamaktad??r",style: TextStyle(color: Colors.red),),);

               }
             
               else{
                return const Center(child: Text("Bilinmeyen bir hata olu??tu",style: TextStyle(color: Colors.red),),);
               }
              },)
            ),
          ),
        );
      }
    );
  }
}
