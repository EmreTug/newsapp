import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newsapp/core/services/API.dart';
import 'package:path/path.dart' as Path;
import '../model/filluser.dart';

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
     Future<void> addUserProfile(FillUser user)async{
      late String image_url;
  var currentUser =Api().getCurrentUser();
              var imageFile = File(user.file.path);
      String fileName = Path.basename(imageFile.path);
      final destination = 'files/$fileName';

      var ref = FirebaseStorage.instance
          .ref("files/NewsImage")
          .child(fileName);

      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        var url = await ref.getDownloadURL();
        image_url=url.toString();
     
      }).catchError((onError) {
        print(onError);
      });
       var result = await _userReference.doc(currentUser!.uid).update({
          'Username': user.username,
          'FullName': user.fullname,
          'PhoneNumber': user.phonenumber,
          'image': image_url,
        });
     }

}