import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../core/enum/viewstate.dart';
import '../../../../../locator.dart';

class ExploreModel extends BaseModel{
   final NewsService _newsService =
      locator<NewsService>();
      late Future<QuerySnapshot<Map<String, dynamic>>> data;
      void fetchNews(){
       data= _newsService.getNews();
      }

   List<Map> myProducts=[];
  Future<void> fetchTopicList() async {
    setState(ViewState.Busy);
    var topics = await _newsService.getTopicsList();
    topics.forEach((key, value) {
      myProducts.add({"name": key,"image":value["image"],"description":value["description"], "isSelected": false});
    });
    setState(ViewState.Idle);
  }
}