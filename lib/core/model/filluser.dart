import 'package:image_picker/image_picker.dart';

class FillUser{
   final String username;
  final String fullname;
  final String phonenumber;
  final PickedFile file;

  FillUser(this.username, this.fullname, this.phonenumber, this.file); 
}