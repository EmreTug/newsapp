import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../../core/services/UserService.dart';
import '../../../../../../locator.dart';

class SelectTopicsModel extends BaseModel {
  final UserService _userService = locator<UserService>();
  List<String> topicList=[];
  void setSelected(int index) {
    myProducts[index]["isSelected"]=!myProducts[index]["isSelected"];
    if(myProducts[index]["isSelected"]==true&&!topicList.contains(myProducts[index]["name"])){
      topicList.add(myProducts[index]["name"]);
    }
    notifyListeners();
  }
  Future<void> addTopic(List<String> topicsList)async{
    await _userService.addUserTopics(topicsList);
  }
  final List<Map> myProducts = [
    {"id": 0, "name": "National", "isSelected": false},
    {"id": 1, "name": "InterNational", "isSelected": false},
    {"id": 2, "name": "Spor", "isSelected": false},
    {"id": 3, "name": "Health", "isSelected": false},
    {"id": 4, "name": "Health", "isSelected": false},
  ];


}
