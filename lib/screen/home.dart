// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/language/lang_controller.dart';
import 'package:todo_app/providers/provider/date_provider.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/widget/display_listview_task.dart';
import 'package:todo_app/widget/helper.dart';
import 'package:todo_app/widget/mytxt.dart';
import 'package:intl/intl.dart';

class Home extends ConsumerWidget {
  static Home builder(BuildContext context, GoRouterState state) =>
      const Home();
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final incompletedTasks = _incompletedTasks(taskState.tasks, ref);
    final selecteddate = ref.watch(dateProvider);
    MyLangController myLangController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: MyTxt(
          text: "List ToDo".tr,
          size: 25,
          color: Colors.yellowAccent,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          children: [
            SizedBox(
              width: 100,
              height: 200,
              child: Lottie.asset("img/3.json"),
            ),
            const Divider(),
            ListTile(
              title: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(child: Text("Choose Language".tr)),
                            actions: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          myLangController.changeLang("ar");
                                          Get.back();
                                        },
                                        child: Text("Arbic".tr)),
                                  ),
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          myLangController.changeLang("en");
                                          Get.back();
                                        },
                                        child: Text("English".tr)),
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.language,
                    size: 30,
                  ),
                  label: Text(
                    "Language".tr,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
            ListTile(
              title: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    if (Get.isDarkMode) {
                      Get.changeTheme(ThemeData.light());
                    } else {
                      Get.changeTheme(ThemeData.dark());
                    }
                  },
                  icon: const Icon(
                    Icons.dark_mode,
                    size: 30,
                  ),
                  label: Text(
                    "Theme".tr,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
            ListTile(
              title: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    Get.toNamed("/about");
                  },
                  icon: const Icon(
                    Icons.help_outline,
                    size: 30,
                  ),
                  label: Text(
                    "about".tr,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Divider(),
                    const SizedBox(height: 9),
                    ElevatedButton.icon(
                      onPressed: () => Helpers.selectDate(context, ref),
                      icon: Icon(Icons.date_range),
                      label: Text(DateFormat.yMMMd().format(selecteddate)),
                    ),

                    // InkWell(
                    //   onTap: () => Helpers.selectDate(context, ref),
                    //   child: MyTxt(
                    //     text: DateFormat.yMMMd().format(selecteddate),
                    //     size: 18,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 65,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 14,
                        left: 14,
                      ),
                      child: MyTxt(
                        text: "Not Completed".tr,
                        size: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 9),
                    ListViewTask(
                      const Color.fromARGB(255, 225, 127, 242),
                      tasks: incompletedTasks,
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.only(right: 14, left: 14),
                      child: MyTxt(
                        text: "Completed".tr,
                        size: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 9),
                    ListViewTask(
                      const Color.fromARGB(255, 196, 218, 236),
                      isCompleteTasks: true,
                      tasks: completedTasks,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed("/add");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: MyTxt(
                          text: "Add".tr,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TaskModels> _completedTasks(List<TaskModels> tasks, WidgetRef ref) {
    final List<TaskModels> filteredTasks = [];
    final selectDate = ref.watch(dateProvider);
    for (var task in tasks) {
      final isTaskDay = Helpers.isGoTaskFromSelectedDate(task, selectDate);
      if (task.isComplete && isTaskDay) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }

//not completed task
  List<TaskModels> _incompletedTasks(List<TaskModels> tasks, WidgetRef ref) {
    final List<TaskModels> filteredTasks = [];
    final selectDate = ref.watch(dateProvider);

    for (var task in tasks) {
      final isTaskDay = Helpers.isGoTaskFromSelectedDate(task, selectDate);
      if (!task.isComplete && isTaskDay) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}
