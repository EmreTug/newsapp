import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:newsapp/core/services/UserService.dart';
import 'package:newsapp/core/viewmodel/base_model.dart';

import '../../../../../../core/model/filluser.dart';
import '../../../../../../locator.dart';

class FillProfileModel extends BaseModel {
    final UserService _userService = locator<UserService>();

   File _imageFile=File("");
  File get getImageFile=>_imageFile;
  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
    }
    notifyListeners();
  }
  Future<void> addUserProfile(FillUser user)async{
    await _userService.addUserProfile(user);
  }
}
