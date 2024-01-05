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
            Text("txt1".tr),
            Text("txt2".tr),
            Text("txt3".tr),
          ],
        ),
      ),
    );
  }
}
