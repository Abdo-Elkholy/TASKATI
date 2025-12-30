import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final int taskColor;
  final String taskTitle;
  final String taskDescription;

  final String taskDAte;
  final String stratTask;
  final String endTask;

  final Function onDelete;

  Task({
    super.key,
    this.taskColor = 0xff4E5AE8,
    required this.endTask,
    required this.stratTask,
    required this.taskDAte,
    required this.taskDescription,
    required this.taskTitle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (e) {
        onDelete();
      },
      background: Container(
        padding: const EdgeInsetsGeometry.all(8),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xF4FF0000),
        ),
        child: const Icon(Icons.close, color: Colors.white, weight: 20),
      ),

      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsetsGeometry.all(8),
        height: 125,
        decoration: BoxDecoration(
          color: Color(taskColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.alarm, color: Colors.white),
                      Text(
                        "${stratTask} - ${endTask}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        taskDescription,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Container(width: 1, height: 100, color: Colors.white),
                const SizedBox(width: 10),
                const RotatedBox(
                  quarterTurns: 3,
                  child: Text("TODO", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
