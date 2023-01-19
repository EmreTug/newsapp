import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../core/services/newsservices.dart';
import '../../../../../locator.dart';

class HomeModel extends BaseModel {
   final NewsService _newsService =
      locator<NewsService>();
      late Future<QuerySnapshot<Map<String, dynamic>>> data;
  final List<Map> myProducts = [
    {"id": 0, "name": "All", "isSelected": false},
    {"id": 1, "name": "InterNational", "isSelected": false},
    {"id": 2, "name": "Spor", "isSelected": false},
    {"id": 3, "name": "National", "isSelected": false},
    {"id": 4, "name": "InterNational", "isSelected": false},
    {"id": 5, "name": "Spor", "isSelected": false},
  ];

  void setSelected(int index) {
    for (var item in myProducts) {
      item["isSelected"] = false;
    }
    myProducts[index]["isSelected"] = !myProducts[index]["isSelected"];
    notifyListeners();
  }
  Future<void> fetchNews()async {
   data= _newsService.getNews();
   
  }
}
