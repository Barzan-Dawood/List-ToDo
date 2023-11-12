import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:todo_app/main.dart';

class MyLangController extends GetxController {
  Locale? intialLang = sharedPreferences!.getString("lang") == null
      ? Get.deviceLocale
      : Locale(sharedPreferences!.getString("lang")!);

  void changeLang(String codLang) {
    Locale locale = Locale(codLang);
    sharedPreferences!.setString("lang", codLang);
    Get.updateLocale(locale);
  }
}
