import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/models/tasks_list.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/widgets/home_wedgits/add_data.dart';

import '../widgets/date.dart';
import '../widgets/home_wedgits/home_app_bar.dart';
import '../widgets/task.dart';
import 'add_screen.dart';
import 'empty_screen.dart';

class HomeScreen extends StatefulWidget {
  UserModel user;

  HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Hive.openBox<TaskModel>('tasks_${widget.user.name}').then((value) {
      setState(() {
        TasksData.fetchDataFromHive(widget.user.name!);
        allDates = TasksData.tasks.keys.toList();
      });
    });
  }

  int selectedIndex = -1;
  String selectedDate = "";
  List<String> allDates = TasksData.tasks.keys.toList();

  @override
  Widget build(BuildContext context) {
    allDates = TasksData.tasks.keys.toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HomeAppBar(name: widget.user.name!, userPhoto: widget.user.photo),
              const SizedBox(height: 20),


              AddData(
                addButton: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddScreen(userId: widget.user.name!),
                    ),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),


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

                          Expanded(
                            flex: 3,
                            child: ListView.separated(
                              itemBuilder: (context, i) {
                                if (TasksData.tasks[selectedDate] != null) {
                                  TaskModel currentTaskData =
                                      TasksData.tasks[selectedDate]![i];
                                  return Task(
                                    task: currentTaskData,
                                    onDelete: () async {
                                      await TasksData.deleteTask(
                                        currentTaskData,
                                        widget.user.name!,
                                      );
                                      setState(() {
                                        allDates = TasksData.tasks.keys.toList();
                                        if (!allDates.contains(selectedDate)) {
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
