import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About App".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
                "ToDo List is a note and diary app for Android devices where you can write down all your experiences and thoughts during the day"
                    .tr),
            Text(
                "You can also use the Sections category to enter memos and various notes with ease: all you have to do is enter the title and text of the note. The advantage of the first daily tasks is that it enables you to arrange the various entries according to their category and give them distinct cards."
                    .tr),
            Text(
                "You can then search for any entry using the date. Thanks to this feature, you will not need to remember exactly where you wrote something. Simply search in history and your past and future notes will be displayed."
                    .tr),
            Text(
                "So it is a comprehensive memo application, which gives you an easy-to-use and elegant interface,"
                    .tr),
            Text(
                "The application does not contain external servers. The application contains the local database. Only your notes are stored in your phone"
                    .tr),
            SizedBox(height: 100),
            Center(
                child: Text(
              "Application developer".tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.greenAccent),
            )),
            Center(
              child: Text(
                "Barzan Daoud Al-Hababi".tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
