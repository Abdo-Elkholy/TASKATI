import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/models/tasks_data.dart';
import 'package:taskati/widgets/home_wedgits/add_data.dart';
import 'package:taskati/widgets/home_wedgits/home_app_par.dart';

import '../widgets/date.dart';
import '../widgets/task.dart';
import 'add_screen.dart';
import 'empty_screen.dart';

class HomeScreen extends StatefulWidget {
  String name;
  XFile? userPhoto;

  HomeScreen({super.key, required this.name, this.userPhoto});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1;
  String selectedDate = "";
  List<String> allDates = TasksData.tasks.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HomeAppPar(name: widget.name, userPhoto: widget.userPhoto),
              const SizedBox(height: 20),

              /***********************/
              AddData(
                addButton: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddScreen()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),

              /**********************/
              Expanded(
                child: TasksData.tasks.isEmpty
                    ? EmptyScreen()
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: TasksData.tasks.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                allDates = TasksData.tasks.keys.toList();
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = i;
                                      selectedDate = allDates[i];
                                    });
                                  },
                                  child: Date(
                                    index: i,
                                    selectedIndex: selectedIndex,
                                    dateToShow: allDates[i],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          /**********************/
                          Expanded(
                            flex: 3,
                            child: ListView.separated(
                              itemBuilder: (context, i) {
                                if (TasksData.tasks[selectedDate] != null) {
                                  TaskModel currentTaskData =
                                      TasksData.tasks[selectedDate]![i];
                                  return Task(
                                    endTask: currentTaskData.endTime,
                                    stratTask: currentTaskData.startTime,
                                    taskDAte: currentTaskData.date,
                                    taskDescription:
                                        currentTaskData.description,
                                    taskTitle: currentTaskData.title,
                                    taskColor: currentTaskData.color,
                                    onDelete: () {
                                      setState(() {
                                        TasksData.tasks[selectedDate]!.removeAt(
                                          i,
                                        );
                                        if (TasksData
                                            .tasks[selectedDate]!
                                            .isEmpty) {
                                          TasksData.tasks.remove(selectedDate);
                                          allDates.remove(selectedDate);
                                          selectedIndex = -1;
                                        }
                                      });
                                    },
                                  );
                                }
                                return null;
                              },
                              separatorBuilder: (context, i) =>
                                  SizedBox(height: 10),
                              itemCount: TasksData.tasks[selectedDate] != null
                                  ? TasksData.tasks[selectedDate]!.length
                                  : 0,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
