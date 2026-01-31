import 'package:hive_flutter/hive_flutter.dart';


part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? photo;
  @HiveField(1)
  String? name;
}
