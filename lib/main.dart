import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/language/lang.dart';
import 'package:todo_app/language/lang_controller.dart';
import 'package:todo_app/screen/about_app.dart';
import 'package:todo_app/screen/add_task_screen.dart';
import 'package:todo_app/screen/home.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyLangController myLangController = Get.put(MyLangController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: myLangController.intialLang,
      translations: MyLang(),
      home: const Home(),
      getPages: [
        GetPage(name: "/home", page: () => const Home()),
        GetPage(name: "/add", page: () => const AddTaskScreen()),
         GetPage(name: "/about", page: () => const AboutApp()),
      ],
 
    );
  }
}
