// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    super.key,
    this.controller,
    this.perfixIcon,
    required this.isShow,
    this.suffixIcon,
    required this.text,
    this.onSubmit,
    this.validator,
    this.maxLines,
    required this.type,
    this.onComplete,
    this.onTap,
  });

  TextEditingController? controller;
  final bool isShow;
  Widget? suffixIcon;
  final TextInputType type;
  final String text;
  Function(String?)? onSubmit;
  String? Function(String?)? validator;
  Widget? perfixIcon;
  final Function()? onComplete;
  final Function()? onTap;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      onEditingComplete: onComplete,
      controller: controller,


      onTap: onTap,
      onFieldSubmitted: onSubmit,
      validator: validator,
      obscureText: isShow,
      style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        contentPadding: const EdgeInsets.all(10),
        suffixIcon: suffixIcon,
        prefixIcon: perfixIcon,
        fillColor: Get.isDarkMode
            ? const Color.fromARGB(255, 29, 29, 29)
            : Colors.grey.shade100,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: BorderSide(
            width: 2.5,
            color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: BorderSide(
            color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
