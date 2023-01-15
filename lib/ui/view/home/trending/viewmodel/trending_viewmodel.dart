import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/model/news.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../locator.dart';

class TrendingModel extends BaseModel{
   final NewsService _newsService =
      locator<NewsService>();
      late Future<QuerySnapshot<Map<String, dynamic>>> newsSnapshot;
      void fetchNews(){
        newsSnapshot= _newsService.getNews();
        
      }
}