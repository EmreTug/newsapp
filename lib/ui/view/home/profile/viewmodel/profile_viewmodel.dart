import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../locator.dart';

class ProfileModel extends BaseModel {
  final NewsService _newsService = locator<NewsService>();
  late Future<QuerySnapshot<Map<String, dynamic>>> _data;
  Future<QuerySnapshot<Map<String, dynamic>>> getData() => _data;
  void fetchNews() {
    _data=_newsService.getNewsByUser();
  }
}
