import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/utils/task_categre.dart';

final categoryProvider = StateProvider<TaskCategory>((ref) {
  return TaskCategory.others;
});
