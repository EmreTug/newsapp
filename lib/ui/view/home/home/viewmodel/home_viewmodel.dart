import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/enum/viewstate.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../core/services/newsservices.dart';
import '../../../../../locator.dart';

class HomeModel extends BaseModel {
  final NewsService _newsService = locator<NewsService>();
  late Future<QuerySnapshot<Map<String, dynamic>>> data;
   List<Map> myProducts=[];
  // final List<Map> myProducts = [
  //   {"id": 0, "name": "All", "isSelected": false},
  //   {"id": 1, "name": "InterNational", "isSelected": false},
  //   {"id": 2, "name": "Spor", "isSelected": false},
  //   {"id": 3, "name": "National", "isSelected": false},
  //   {"id": 4, "name": "InterNational", "isSelected": false},
  //   {"id": 5, "name": "Spor", "isSelected": false},
  // ];
  //  List<Map<String, dynamic>> myProducts=List.empty();

  void setSelected(int index) {
    for (var item in myProducts) {
      item["isSelected"] = false;
    }
    myProducts[index]["isSelected"] = !myProducts[index]["isSelected"];
    notifyListeners();
  }

  Future<void> fetchNews() async {
    data = _newsService.getNews();
  }

  Future<void> fetchTopicList() async {
    setState(ViewState.Busy);
    var topics = await _newsService.getTopicsList();
    topics.forEach((key, value) {
      myProducts.add({"name": key,"image":value["image"],"description":value["description"], "isSelected": false});
    });
    setState(ViewState.Idle);
  }
}
