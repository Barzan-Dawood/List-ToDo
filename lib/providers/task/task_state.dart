import 'package:equatable/equatable.dart';
import 'package:todo_app/data_models/models/model.dart';

class TaskState extends Equatable {
  final List<TaskModels> tasks;

  const TaskState(this.tasks);
  const TaskState.initial({this.tasks = const []});

  TaskState copyWith({
    List<TaskModels>? tasks,
  }) {
    return TaskState(
      tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [tasks];
}
