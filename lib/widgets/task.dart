import 'package:flutter/material.dart';
import 'package:taskati/models/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel task;
  final Function onDelete;
  final Function onComplete;

  const Task({
    super.key,
    required this.onDelete,
    required this.onComplete,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          // Swipe left to delete
          return true;
        } else if (direction == DismissDirection.startToEnd) {
          // Swipe right to complete
          return true;
        }
        return false;
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete();
        } else if (direction == DismissDirection.startToEnd) {
          onComplete();
        }
      },
      background: Container(
        // Swipe right - Complete (Green)
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF4CAF50),
        ),
        child: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 30),
            SizedBox(width: 8),
            Text(
              'Complete',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        // Swipe left - Delete (Red)
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFF44336),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.delete, color: Colors.white, size: 30),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 125,
        decoration: BoxDecoration(
          color: task.isCompleted 
              ? Colors.grey.shade400 
              : Color(task.color),
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
                    task.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: task.isCompleted 
                          ? TextDecoration.lineThrough 
                          : null,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.alarm, color: Colors.white),
                      Text(
                        "${task.startTime} - ${task.endTime}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        task.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: task.isCompleted 
                              ? TextDecoration.lineThrough 
                              : null,
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
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    task.isCompleted ? "DONE" : "TODO",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
