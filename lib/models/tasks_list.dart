import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/models/task_model.dart';

class TasksData {
  static Map<String, List<TaskModel>> tasks = {};

  static void fetchDataFromHive(String userId) {
    var box = Hive.box<TaskModel>('tasks_$userId');
    tasks.clear();

    for (var task in box.values) {
      if (tasks.containsKey(task.date)) {
        tasks[task.date]!.add(task);
      } else {
        tasks[task.date] = [task];
      }
    }
  }


  static Future<void> addTask(TaskModel task, String userId) async {

    var box = Hive.box<TaskModel>('tasks_$userId');
    await box.add(task);


    if (tasks.containsKey(task.date)) {
      tasks[task.date]!.add(task);
    } else {
      tasks[task.date] = [task];
    }
  }


  static Future<void> deleteTask(TaskModel task, String userId) async {

    await task.delete();


    if (tasks.containsKey(task.date)) {
      tasks[task.date]!.remove(task);
      if (tasks[task.date]!.isEmpty) {
        tasks.remove(task.date);
      }
    }
  }

  static Future<void> markAsCompleted(TaskModel task, String userId) async {
    task.isCompleted = true;
    await task.save();
  }
}
