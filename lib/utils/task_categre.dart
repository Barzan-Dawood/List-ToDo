import 'package:flutter/material.dart';

enum TaskCategory {
  education(Icons.school, Colors.black),
  health(Icons.favorite, Colors.red),
  home(Icons.home, Colors.brown),
  others(Icons.calendar_month_rounded, Colors.teal),
  personal(Icons.person, Color.fromARGB(255, 150, 150, 9)),
  shopping(Icons.shopping_bag, Color.fromARGB(255, 13, 132, 17)),
  social(Icons.people, Colors.cyanAccent),
  travel(Icons.flight, Colors.pink),
  work(Icons.work, Colors.amber);

  static TaskCategory stringToTaskCategory(String name) {
    try {
      return TaskCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategory(this.icon, this.color);
}
