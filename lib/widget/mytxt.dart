import 'package:flutter/material.dart';

class MyTxt extends StatelessWidget {
  const MyTxt({
    super.key,
    required this.text,
    this.size,
    this.fontWeight, this.color,
  });
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
