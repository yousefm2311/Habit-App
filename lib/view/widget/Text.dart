
// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key, this.textStyle, required this.text});

  final String text;

  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
