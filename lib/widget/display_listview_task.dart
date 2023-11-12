import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/app_alerts.dart';
import 'package:todo_app/widget/myContainer.dart';
import 'package:todo_app/widget/task_detils.dart';
import 'package:todo_app/widget/task_tile.dart';

class ListViewTask extends ConsumerWidget {
  const ListViewTask(this.color,
      {super.key, required this.tasks, this.isCompleteTasks = false});

  final List<TaskModels> tasks;
  final bool isCompleteTasks;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = isCompleteTasks
        ? MediaQuery.sizeOf(context).height * 0.25
        : MediaQuery.sizeOf(context).height * 0.3;

    return MyContainer(
      height: height,
      color: color,
      child: tasks.isEmpty
          ? Center(
              child: isCompleteTasks
                  ? Lottie.asset("img/2.json")
                  : Lottie.asset("img/1.json"))
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              //padding: EdgeInsets.only(left: 16,top: 10,bottom: 10),
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                    onLongPress: () async {
                      AppAlerts.showDeleteAlertDialog(context, ref, task);
                    },
                    onTap: () async {
                      //  show detils
                      await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return TaskDetils(task: task);
                          });
                    },
                    child: TaskTile(
                      task: task,
                      onCompleted: (val) async {
                        await ref
                            .read(taskProvider.notifier)
                            .updateTask(task)
                            .then((value) {
                          AppAlerts.displaySnackbar(
                              context,
                              task.isComplete
                                  ? "Task incompleted".tr
                                  : "Task completed".tr);
                          return null;
                        });
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                );
              },
            ),
    );
  }
}
