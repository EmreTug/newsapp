import 'package:image_picker/image_picker.dart';

class News{
  final String title;
  final String description;
  final PickedFile file;

  News(this.title, this.description, this.file);

}