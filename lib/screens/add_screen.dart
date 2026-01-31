import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/models/tasks_list.dart';

import '../widgets/app_button.dart';
import '../widgets/app_inputs.dart';

class AddScreen extends StatefulWidget {
  final String userId;

  const AddScreen({super.key, required this.userId});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<int> tasksColors = [0xff4E5AE8, 0xffFF8746, 0xffFF4667];
  int id = 0;
  var formKey = GlobalKey<FormState>();
  int selectedColor = -1;
  final TextEditingController taskTitle = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();
  final TextEditingController taskDAte = TextEditingController();
  final TextEditingController stratTask = TextEditingController();
  final TextEditingController endTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff4E5AE8)),
        backgroundColor: const Color(0xffe6d7ff),
        title: const Text(
          "Add Task",
          style: TextStyle(color: Color(0xff4E5AE8)),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: const Color(0xffe6d7ff),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),

        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    AppInputs(hint: "Enter title", data: taskTitle),
                    const SizedBox(height: 20),

                    const Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    AppInputs(
                      hint: "Enter description",
                      lines: 3,
                      data: taskDescription,
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    AppInputs(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        ).then((Value) {
                          taskDAte.text = DateFormat.yMd().format(
                            Value ?? DateTime.now(),
                          );
                        });
                      },
                      data: taskDAte,
                      hint: "2025/12/4",
                      inputIcon: Icon(Icons.date_range),
                      read: true,
                    ),

                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: AppInputs(
                            hint: "Start Time",
                            data: stratTask,
                            inputIcon: Icon(Icons.access_time),
                            read: true,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((Value) {
                                stratTask.text = Value?.format(context) ?? "";
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: AppInputs(
                            data: endTask,
                            hint: "End Time",
                            inputIcon: Icon(Icons.access_time),
                            read: true,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((Value) {
                                endTask.text = Value?.format(context) ?? "";
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    const Text(
                      "Color",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),

                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  selectedColor = i;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color(tasksColors[i]),
                                  child: selectedColor == i
                                      ? Icon(Icons.done, color: Colors.white)
                                      : null,
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Spacer(),
                    Container(
                      alignment: Alignment(0, 0),
                      child: AppButton(
                        data: "Create Task",
                        onClick: () async {
                          if (formKey.currentState?.validate() == true) {
                            var newTask = TaskModel(
                              title: taskTitle.text,
                              description: taskDescription.text,
                              date: taskDAte.text,
                              startTime: stratTask.text,
                              endTime: endTask.text,
                              color: tasksColors[selectedColor],
                              id: 0,
                            );

                            await TasksData.addTask(newTask, widget.userId);

                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
