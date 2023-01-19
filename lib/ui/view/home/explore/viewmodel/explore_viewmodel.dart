import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../locator.dart';

class ExploreModel extends BaseModel{
   final NewsService _newsService =
      locator<NewsService>();
      late Future<QuerySnapshot<Map<String, dynamic>>> data;
      void fetchNews(){
       data= _newsService.getNews();
      }
}