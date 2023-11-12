import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:todo_app/providers/provider/category_provider.dart';
import 'package:todo_app/utils/task_categre.dart';
import 'package:todo_app/widget/circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categores = TaskCategory.values.toList();
    final selectedCategory = ref.watch(categoryProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text("Category".tr,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categores.length,
                  itemBuilder: (context, index) {
                    final category = categores[index];
                    return InkWell(
                      onTap: () {
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: CircleContainer(
                        color: category.color.withOpacity(0.3),
                        child: Icon(
                          category.icon,
                          color: category == selectedCategory
                              ? Colors.deepPurpleAccent
                              : category.color,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ))),
        ],
      ),
    );
  }
}
