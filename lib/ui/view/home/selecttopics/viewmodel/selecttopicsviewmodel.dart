import 'package:newsapp/core/viewmodel/base_model.dart';

class SelectTopicsModel extends BaseModel {
  void setSelected(int index) {
    myProducts[index]["isSelected"]=!myProducts[index]["isSelected"];
    notifyListeners();
  }

  final List<Map> myProducts = [
    {"id": 0, "name": "National", "isSelected": false},
    {"id": 1, "name": "InterNational", "isSelected": false},
    {"id": 2, "name": "Spor", "isSelected": false},
    {"id": 3, "name": "Health", "isSelected": false},
    {"id": 4, "name": "Health", "isSelected": false},
  ];
}
