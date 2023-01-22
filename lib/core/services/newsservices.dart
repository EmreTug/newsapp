import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newsapp/core/model/news.dart';
import 'package:path/path.dart' as Path;

class NewsService{
    final _newsReference = FirebaseFirestore.instance.collection('News');
    final _userReference = FirebaseFirestore.instance.collection('User');
    final _topicReference = FirebaseFirestore.instance.collection('Topic');

  Future<void> addNews(News news) async {
    try {
      final FirebaseAuth _auth =
          FirebaseAuth.instance;
      late String image_url;
        var imageFile = File(news.file.path);
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
      
         var result = await _newsReference.add({
          'title': news.title,
          'description': news.description,
          'photoUrl': image_url,
          'userUid': _auth.currentUser?.uid,
          'time':Timestamp.now()
        });
        await _userReference
            .doc(_auth.currentUser?.uid)
            .collection("News")
            .add({'NewsId': result.id});
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getNews() async {
    return await _newsReference.get();
  }
  Future<DocumentSnapshot<Map<String, dynamic>>> getNewsByDocId(String docId) async {
    return await _newsReference.doc(docId).get();
  }
   Future<QuerySnapshot<Map<String, dynamic>>> getNewsByUser() async {
 final FirebaseAuth _auth =
          FirebaseAuth.instance;
    return await _newsReference.where("userUid",isEqualTo:_auth.currentUser!.uid).get();
  }
    Future<Map<String, dynamic>> getTopicsList() async {
     
     var result=await _topicReference.get();
     var list=result.docs.first.data();
     return list;

  }
}