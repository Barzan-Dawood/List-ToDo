// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo_app/providers/provider/date_provider.dart';
import 'package:todo_app/providers/provider/time_provider.dart';
import 'package:todo_app/widget/helper.dart';
import 'package:todo_app/widget/my_text_filed.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: MyTextFiled(
            title: 'Date'.tr,
            hintText: DateFormat.yMMMd().format(date),
            readOnly: true,
            suffixIcon: IconButton(
                onPressed: () {
                  Helpers.selectDate(context , ref);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.calendar,
                  color: Colors.blue,
                )),
            controller: null,
            maxlines: null,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: MyTextFiled(
            title: 'Time'.tr,
            hintText: Helpers.timeToString(time),
            readOnly: true,
            suffixIcon: IconButton(
                onPressed: () {
                  _selectTime(context,ref);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.clock,
                  color: Colors.blue,
                )),
            controller: null,
            maxlines: null,
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context , WidgetRef ref) async {

    TimeOfDay? picktime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picktime != null) {
       ref.read(timeProvider.notifier).state = picktime;
    }
  }

}
