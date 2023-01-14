
import 'package:newsapp/core/viewmodel/base_model.dart';

class AuthorProfileModel extends BaseModel {
 late bool isFollow;
 late int followers;
 late int following;
 late int news;

 void setFollow(){
  isFollow=!isFollow;
  news+1;
  notifyListeners();
 }
  
}
