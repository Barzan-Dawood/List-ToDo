import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/providers/provider/category_provider.dart';
import 'package:todo_app/providers/provider/date_provider.dart';
import 'package:todo_app/providers/provider/time_provider.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/app_alerts.dart';
import 'package:todo_app/widget/helper.dart';
import 'package:todo_app/widget/my_text_filed.dart';
import 'package:todo_app/widget/mytxt.dart';
import 'package:todo_app/widget/select_category.dart';
import 'package:todo_app/widget/select_date_time.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  static AddTaskScreen builder(BuildContext context, GoRouterState state) =>
      const AddTaskScreen();

  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _note = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _title.dispose();
    _note.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: MyTxt(
            text: "Add New Task".tr,
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
            size: 22),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SelectCategory(),
              const SizedBox(height: 10),
              const SelectDateTime(),
              const SizedBox(height: 10),
              MyTextFiled(
                title: 'Task Title'.tr,
                hintText: "Title".tr,
                controller: _title,
                maxlines: null,
              ),
              const SizedBox(height: 10),
              MyTextFiled(
                title: 'Title Note'.tr,
                hintText: "Note".tr,
                controller: _note,
                maxlines: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 90, left: 90, top: 25),
                child: ElevatedButton.icon(
                  onPressed: _addTask,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Save".tr,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTask() async {
    final title = _title.text.trim();
    final note = _note.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = TaskModels(
          title: title,
          note: note,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          category: category,
          isComplete: false);

      await ref.read(taskProvider.notifier).creatTask(task).then((value) {
        AppAlerts.displaySnackbar(context, "Task Add Successfully".tr);
        // context.go(RoutesLocation.Home);
        Get.toNamed("/home");
      });
    } else {
      AppAlerts.displaySnackbar(context, "Task Title cannot be empty");
    }
  }
}
