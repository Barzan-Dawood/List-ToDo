import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/widget/circle_container.dart';

class TaskDetils extends StatelessWidget {
  const TaskDetils({super.key, required this.task});
  final TaskModels task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ListView(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(task.category.icon, color: task.category.color),
          ),
          const SizedBox(height: 15),
          Text(
            task.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            task.time,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 15),
          Visibility(
            visible: !task.isComplete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("task to be completed on ".tr),
                Text(task.date),
                Icon(Icons.check_box, color: task.category.color),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Divider(thickness: 1.5, color: task.category.color),
          const SizedBox(height: 15),
          Center(
            child: Text(task.note.isEmpty
                ? "There is no note in this task".tr
                : task.note),
          ),
          const SizedBox(height: 15),
          Visibility(
            visible: task.isComplete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("task completed".tr),
                const Icon(Icons.check_box, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
