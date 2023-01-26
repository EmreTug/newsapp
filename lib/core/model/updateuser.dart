import 'package:image_picker/image_picker.dart';

class UpdateUser{
  final  String? username;
  final String? fullname;
  final String? phonenumber;
  final PickedFile? file;
  final String? bio;
  final String? website;

  UpdateUser({this.username, this.fullname, this.phonenumber, this.file, this.bio, this.website}); 
}