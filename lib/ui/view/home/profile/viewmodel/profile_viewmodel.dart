import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../core/services/UserService.dart';
import '../../../../../locator.dart';

class ProfileModel extends BaseModel {
  final NewsService _newsService = locator<NewsService>();
  final UserService _userService = locator<UserService>();
  late Future<QuerySnapshot<Map<String, dynamic>>> _data;
  late Future<DocumentSnapshot<Object?>> _userProfile;

  Future<QuerySnapshot<Map<String, dynamic>>> getData() => _data;
  Future<DocumentSnapshot> getUserProfile() => _userProfile;
  void fetchNews() {
    _data=_newsService.getNewsByUser();
  }
  void fetchUserProfile(){
    _userProfile=_userService.getUserProfile();
  }

}
