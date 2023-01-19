import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../core/services/newsservices.dart';
import '../../../../../locator.dart';

class BookMarkModel extends BaseModel{
   final NewsService _newsService =
      locator<NewsService>();
      late Future<QuerySnapshot<Map<String, dynamic>>> data;
      void fetchNews(){
       data= _newsService.getNews();
      }
}