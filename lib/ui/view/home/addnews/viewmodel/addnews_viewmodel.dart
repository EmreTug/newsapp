import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../core/model/news.dart';
import '../../../../../locator.dart';

class AddNewsModel extends BaseModel {
  final NewsService _newsService = locator<NewsService>();
  File _imageFile = File("");
  File get getImageFile => _imageFile;
  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
    }
    notifyListeners();
  }
  Future<void> addNews(News news)async{
      return await _newsService.addNews(news);
  }
}
