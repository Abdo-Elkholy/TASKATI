import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/models/user_model.dart';

import 'taskati.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  runApp(TaskatiApp());
}
