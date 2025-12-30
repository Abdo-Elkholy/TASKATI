import 'package:taskati/models/task_model.dart';

class TasksData {
  static Map<String, List<TaskModel>> tasks = {};

  static void deleteTask(String dateKey, int index) {
    if (tasks.containsKey(dateKey)) {
      tasks[dateKey]?.removeAt(index);
      if (tasks[dateKey]!.isEmpty) {
        tasks.remove(dateKey);
      }
    }
  }
}
