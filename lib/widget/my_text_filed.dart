import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.maxlines,
      this.suffixIcon,
      this.readOnly = false});
  final String title;
  final String hintText;
  final int? maxlines;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        TextField(
          maxLines: maxlines,
          readOnly: readOnly,
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          onChanged: (val) {},
        ),
      ],
    );
  }
}
