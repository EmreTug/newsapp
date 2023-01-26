import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newsapp/core/services/API.dart';
import 'package:path/path.dart' as Path;
import '../model/filluser.dart';
import '../model/updateuser.dart';

class UserService {
  final _userReference = FirebaseFirestore.instance.collection('User');
  Future<void> addUserProfile(FillUser user) async {
    late String image_url;
    var currentUser = Api().getCurrentUser();
    var imageFile = File(user.file.path);
    String fileName = Path.basename(imageFile.path);
    final destination = 'files/$fileName';

    var ref = FirebaseStorage.instance.ref("files/NewsImage").child(fileName);

    UploadTask uploadTask = ref.putFile(imageFile);
    await uploadTask.whenComplete(() async {
      var url = await ref.getDownloadURL();
      image_url = url.toString();
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

  Future<void> updateUserProfile(UpdateUser user) async {
    bool isImage = false,
        isBio = false,
        isNumber = false,
        isWebsite = false,
        isUsername = false,
        isFullname = false;
    isImage = (user.file == null) ? false : true;
    isBio = (user.bio == null) ? false : true;
    isNumber = (user.phonenumber == null) ? false : true;
    isFullname = (user.fullname == null) ? false : true;
    isWebsite = (user.website == null) ? false : true;
    isUsername = (user.username == null) ? false : true;
    late String image_url;
    var currentUser = Api().getCurrentUser();
    if (isImage) {
      var imageFile = File(user.file!.path);
      String fileName = Path.basename(imageFile.path);
      final destination = 'files/$fileName';

      var ref = FirebaseStorage.instance.ref("files/NewsImage").child(fileName);

      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        var url = await ref.getDownloadURL();
        image_url = url.toString();
      }).catchError((onError) {
        print(onError);
      });
    }
    if (isUsername) {
      await _userReference.doc(currentUser!.uid).update({
        'Username': user.username,
      });
    }
    if(isFullname){
       await _userReference.doc(currentUser!.uid).update({
        'FullName': user.fullname,
      });
    }
     if(isNumber){
       await _userReference.doc(currentUser!.uid).update({
        'PhoneNumber': user.phonenumber,
      });
    } if(isBio){
       await _userReference.doc(currentUser!.uid).update({
        'Bio': user.bio,
      });
    }
     if(isWebsite){
       await _userReference.doc(currentUser!.uid).update({
        'Website': user.website,
      });
    } if(isImage){
       await _userReference.doc(currentUser!.uid).update({
        'image': image_url,
      });
    }
  }

  Future<void> addUserNewsSource(List<String> newsSourceList) async {
    var currentUser = Api().getCurrentUser();

    _userReference.doc(currentUser!.uid).update({"NewsSource": newsSourceList});
  }

  Future<void> addUserTopics(List<String> topicsList) async {
    var currentUser = Api().getCurrentUser();

    _userReference.doc(currentUser!.uid).update({"Topics": topicsList});
  }

  Future<DocumentSnapshot> getUserProfile() async {
    var currentUser = Api().getCurrentUser();

    return _userReference.doc(currentUser!.uid).get();
  }
}
