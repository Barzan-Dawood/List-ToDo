import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/data_models/task_repository.dart';
import 'package:todo_app/providers/task/task_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;
  TaskNotifier(this._repository) : super(const TaskState.initial()) {
    getTask();
  }

  Future<void> creatTask(TaskModels task) async {
    try {
      await _repository.createTask(task);
      getTask();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(TaskModels task) async {
    try {
      await _repository.deleteTask(task);
      getTask();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(TaskModels task) async {
    try {
      final isCompleted = !task.isComplete;
      final updatedTask = task.copyWith(isComplete: isCompleted);
      await _repository.updateTask(updatedTask);
      getTask();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTask() async {
    try {
      final tasks = await _repository.getAllTask();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
