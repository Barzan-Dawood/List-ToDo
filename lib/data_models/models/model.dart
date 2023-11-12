import 'package:equatable/equatable.dart';
import 'package:todo_app/utils/task_categre.dart';
import 'package:todo_app/utils/task_keys.dart';

class TaskModels extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategory category;
  final bool isComplete;

  const TaskModels(
      {this.id,
      required this.title,
      required this.note,
      required this.time,
      required this.date,
      required this.category,
      required this.isComplete});

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      isComplete,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.note: note,
      TaskKeys.time: time,
      TaskKeys.date: date,
      TaskKeys.category: category.name,
      TaskKeys.isComplete: isComplete ? 1 : 0,
    };
  }

  factory TaskModels.fromJson(Map<String, dynamic> map) {
    return TaskModels(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      note: map[TaskKeys.note],
      time: map[TaskKeys.time],
      date: map[TaskKeys.date],
      category: TaskCategory.stringToTaskCategory(map[TaskKeys.category]),
      isComplete: map[TaskKeys.isComplete] == 1 ? true : false,
    );
  }

  TaskModels copyWith({
    int? id,
    String? title,
    String? note,
    String? time,
    String? date,
    TaskCategory? category,
    bool? isComplete,
  }) {
    return TaskModels(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      category: category ?? this.category,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
