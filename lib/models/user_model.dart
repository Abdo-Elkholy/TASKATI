import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UserModel {
  static int id = 0;
  XFile? photo;
  XFile? image;
  TextEditingController name = TextEditingController();

  UserModel() {
    id++;
  }
}
