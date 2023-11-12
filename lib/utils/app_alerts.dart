import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/providers/task/task_provider.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ));
  }

  static Future<void> showDeleteAlertDialog(
      BuildContext context, WidgetRef ref, TaskModels task) async {
    Widget backButton = ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        label: Text("No".tr, style: const TextStyle(fontSize: 18)));

    Widget deleteButton = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
          AppAlerts.displaySnackbar(context, "Task Delete Successfully".tr);
          // context.pop();
          Get.back();
        });
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
      label: Text(
        "Yes".tr,
        style: const TextStyle(fontSize: 18),
      ),
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "Are you sure you want to delete this task ?".tr,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            deleteButton,
            const SizedBox(width: 20),
            backButton,
          ],
        ),
      ],
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
