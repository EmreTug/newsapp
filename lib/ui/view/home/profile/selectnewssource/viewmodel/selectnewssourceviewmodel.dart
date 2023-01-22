import 'package:newsapp/core/services/UserService.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../../core/services/newsservices.dart';
import '../../../../../../locator.dart';

class SelectNewsSourceModel extends BaseModel {
  final UserService _userService = locator<UserService>();
  List<String> newsSource = [];
  final List<Map> myProducts = [
    {"id": 0, "name": "CNBC", "isSelected": false},
    {"id": 1, "name": "BBC", "isSelected": false},
    {"id": 2, "name": "ATV", "isSelected": false},
    {"id": 3, "name": "A HABER", "isSelected": false},
    {"id": 4, "name": "TRT HABER", "isSelected": false},
    {"id": 5, "name": "FOX HABER", "isSelected": false},
    {"id": 6, "name": "Spor", "isSelected": false},
    {"id": 7, "name": "InterNational", "isSelected": false},
    {"id": 8, "name": "Spor", "isSelected": false},
    {"id": 9, "name": "InterNational", "isSelected": false},
    {"id": 10, "name": "Spor", "isSelected": false},
    {"id": 11, "name": "InterNational", "isSelected": false},
    {"id": 12, "name": "Spor", "isSelected": false},
  ];
  Future<void> addUserNewsSource(List<String> newsSources) async {
    await _userService.addUserNewsSource(newsSources);
  }

  void setSelected(int index) {
    myProducts[index]["isSelected"] = !myProducts[index]["isSelected"];
    if(myProducts[index]["isSelected"]==true&&!newsSource.contains(myProducts[index]["name"])){
      newsSource.add(myProducts[index]["name"]);
    }
    notifyListeners();
  }
}
