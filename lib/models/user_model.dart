import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  XFile? photo;
  XFile? image;
  String? name;
}
