// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color,
      required this.width,
      required this.height,
      this.borderShow = false});

  final Function() onPressed;
  final Widget text;
  Color? color;
  final double width;
  final double height;
  bool borderShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: borderShow
            ? Border.all(width: 1.5, color: Colors.grey.shade300)
            : null,
        color: color,
        borderRadius: BorderRadius.circular(
          13.0,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
