import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/db/task_database.dart';

final taskDatasourceProvider = Provider<TaskDataBasesource>((ref) {
 // final datasource = ref.watch(taskDatasourceProvider);
  return TaskDataBasesource();
});
