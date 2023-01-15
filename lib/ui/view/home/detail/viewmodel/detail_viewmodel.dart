import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../locator.dart';

class DetailModel extends BaseModel{
   final NewsService _newsService =
      locator<NewsService>();
      late Future<DocumentSnapshot<Map<String, dynamic>>> _data;
      Future<DocumentSnapshot<Map<String, dynamic>>> getData()=>_data;
      void fetchData(String docId){
       _data= _newsService.getNewsByDocId(docId);
      }
}