import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'taskati.dart';

void main() async {
  await Hive.initFlutter();
  //await Hive.openBox('myBox');
  runApp(TaskatiApp());
}
