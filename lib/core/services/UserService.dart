import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/core/services/API.dart';

class UserService {
  
    final _userReference = FirebaseFirestore.instance.collection('User');
     Future<void> addUserNewsSource(List<String> newsSourceList) async {
  var currentUser =Api().getCurrentUser();

      _userReference.doc(currentUser!.uid).update({"NewsSource":newsSourceList});
     }
      Future<void> addUserTopics(List<String> topicsList) async {
  var currentUser =Api().getCurrentUser();

      _userReference.doc(currentUser!.uid).update({"Topics":topicsList});

     }

}