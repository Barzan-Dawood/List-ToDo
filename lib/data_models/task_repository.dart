
import 'package:todo_app/data_models/models/model.dart';

abstract class TaskRepository {
  Future<void> createTask(TaskModels task);
  Future<void> updateTask(TaskModels task);
  Future<void> deleteTask(TaskModels task);
  Future<List<TaskModels>> getAllTask();
}
