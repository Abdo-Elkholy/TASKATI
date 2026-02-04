import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
  late TextEditingController _nameController;
  final ImagePicker _imagePicker = ImagePicker();
  String? _tempPhotoPath;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);

    Hive.openBox<TaskModel>('tasks_${widget.user.name}').then((value) {
      setState(() {
        TasksData.fetchDataFromHive(widget.user.name!);
        allDates = TasksData.tasks.keys.toList();
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  int selectedIndex = -1;
  String selectedDate = "";
  List<String> allDates = TasksData.tasks.keys.toList();

  void _showEditProfileBottomSheet() {
    _nameController.text = widget.user.name ?? '';
    _tempPhotoPath = widget.user.photo;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Title
                  const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Profile photo
                  GestureDetector(
                    onTap: () async {
                      final XFile? image = await _imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setModalState(() {
                          _tempPhotoPath = image.path;
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color(0xff4E5AE8),
                          child: CircleAvatar(
                            radius: 47,
                            backgroundColor: const Color(0xffe3d6d6),
                            backgroundImage: _tempPhotoPath != null
                                ? FileImage(File(_tempPhotoPath!))
                                : null,
                            child: _tempPhotoPath == null
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Color(0xFF00418A),
                                  )
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Color(0xff4E5AE8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to change photo',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Name input field
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff4E5AE8),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _saveProfile();
                        if (mounted) {
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4E5AE8),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _saveProfile() async {
    final newName = _nameController.text.trim();
    
    if (newName.isNotEmpty) {
      widget.user.name = newName;
      widget.user.photo = _tempPhotoPath;
      await widget.user.save();
      
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    allDates = TasksData.tasks.keys.toList();
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HomeAppBar(
                name: widget.user.name!,
                userPhoto: widget.user.photo,
                onProfileTap: _showEditProfileBottomSheet,
              ),
              const SizedBox(height: 20),

              AddData(
                addButton: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddScreen(userId: widget.user.name!),
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
                                    onComplete: () async {
                                      await TasksData.markAsCompleted(
                                        currentTaskData,
                                        widget.user.name!,
                                      );
                                      setState(() {});
                                    },
                                    onDelete: () async {
                                      await TasksData.deleteTask(
                                        currentTaskData,
                                        widget.user.name!,
                                      );
                                      setState(() {
                                        allDates = TasksData.tasks.keys
                                            .toList();
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
