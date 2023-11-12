import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data_models/repositories/task_repositories_provider.dart';
import 'package:todo_app/providers/task/task_notfier.dart';
import 'package:todo_app/providers/task/task_state.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);

  return TaskNotifier(repository);
});
