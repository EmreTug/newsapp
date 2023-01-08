import 'package:newsapp/core/viewmodel/base_model.dart';

class SelectNewsSourceModel extends BaseModel{
     final List<Map> myProducts = [
      {"id": 0, "name": "National", "isSelected": false},
      {"id": 1, "name": "InterNational", "isSelected": false},
      {"id": 2, "name": "Spor", "isSelected": false},
      {"id": 3, "name": "InterNational", "isSelected": false},
      {"id": 4, "name": "Spor", "isSelected": false},
      {"id": 5, "name": "InterNational", "isSelected": false},
      {"id": 6, "name": "Spor", "isSelected": false},
      {"id": 7, "name": "InterNational", "isSelected": false},
      {"id": 8, "name": "Spor", "isSelected": false},
      {"id": 9, "name": "InterNational", "isSelected": false},
      {"id": 10, "name": "Spor", "isSelected": false},
      {"id": 11, "name": "InterNational", "isSelected": false},
      {"id": 12, "name": "Spor", "isSelected": false},
    ];

    void setSelected(int index) {
    myProducts[index]["isSelected"]=!myProducts[index]["isSelected"];
    notifyListeners();
  }
}