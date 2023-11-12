import 'package:flutter/material.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/widget/circle_container.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});
  final TaskModels task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final double iconOpacity = task.isComplete ? 0.3 : 0.5;
    final backgroundOpacity = task.isComplete ? 0.1 : 0.3;
    final textDecoration =
        task.isComplete ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isComplete ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                    style: TextStyle(fontSize: 16, fontWeight: fontWeight)
                        .copyWith(decoration: textDecoration),
                    maxLines: 2),
                Text(
                  task.time,
                  style: const TextStyle(
                    fontSize: 15,
                  ).copyWith(decoration: textDecoration),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isComplete,
            onChanged: onCompleted,
         //   checkColor: colors.surface
          ),
        ],
      ),
    );
  }
}
