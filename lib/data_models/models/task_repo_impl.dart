import 'package:todo_app/db/task_database.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/data_models/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataBasesource _basesource;

  TaskRepositoryImpl(this._basesource);

  @override
  Future<void> createTask(TaskModels task) async {
    try {
      await _basesource.addTask(task);
    } catch (e) {
      throw 'e';
    }
  }

  @override
  Future<void> deleteTask(TaskModels task) async {
    try {
      await _basesource.deleteTask(task);
    } catch (e) {
      throw 'e';
    }
  }

  @override
  Future<List<TaskModels>> getAllTask() async {
    try {
      return await _basesource.getAllTasks();
    } catch (e) {
      throw 'e';
    }
  }

  @override
  Future<void> updateTask(TaskModels task) async {
    try {
      await _basesource.updateTask(task);
    } catch (e) {
      throw 'e';
    }
  }
}
