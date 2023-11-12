import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data_models/models/model.dart';
import 'package:todo_app/providers/provider/date_provider.dart';

class Helpers {
  Helpers._();
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date =
          DateTime(now.year, now.month, now.day, time.hour, time.minute);
      return DateFormat.jm().format(date);
    } catch (e) {
      return "12:8 pm";
    }
  }

  static void selectDate(BuildContext context, WidgetRef ref) async {
  //  final intialDate = ref.read(dateProvider);
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2090),
    );

    if (pickDate != null) {
      ref.read(dateProvider.notifier).state = pickDate;
    }
  }

  static DateTime _txtToDateTime(String dateTxt) {
    try {
      DateFormat format = DateFormat.yMMMd();
      return format.parse(dateTxt);
    } catch (e) {
      return DateTime.now();
    }
  }

  static bool isGoTaskFromSelectedDate(TaskModels task, DateTime selectDate) {
    final DateTime myTaskDate = _txtToDateTime(task.date);
    if (myTaskDate.year == selectDate.year &&
        myTaskDate.month == selectDate.month &&
        myTaskDate.day == selectDate.day) {
      return true;
    }

    return false;
  }
}
