import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/models/task_model.dart';

@HiveType(typeId: 1)
class TasksData {
  int id = 0;
  static Map<String, List<TaskModel>> tasks = {};
}
