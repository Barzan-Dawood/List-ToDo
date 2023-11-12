import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data_models/data_source/task_datasource_provider.dart';
import 'package:todo_app/data_models/models/task_repo_impl.dart';
import 'package:todo_app/data_models/task_repository.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
