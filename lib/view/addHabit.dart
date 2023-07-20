// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hobit_app/core/view_model/add_habit_view_model.dart';
import 'package:hobit_app/view/widget/MyBotton.dart';
import 'package:hobit_app/view/widget/MyTextField.dart';
import 'package:hobit_app/view/widget/Text.dart';
import 'package:hobit_app/view/widget/icon_broken.dart';

class AddHabit extends GetWidget<AddHabitViewModel> {
  const AddHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus) {
          currentScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Add Habit',
            textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  MyTextFormField(
                    isShow: false,
                    text: 'title',
                    perfixIcon: const Icon(Icons.title),
                    type: TextInputType.text,
                    onComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    isShow: false,
                    text: 'note',
                    maxLines: 7,
                    type: TextInputType.text,
                    perfixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                          bottom: MediaQuery.of(context).size.height * .2),
                      child: const Icon(
                        IconBroken.Document,
                      ),
                    ),
                    onComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    controller: controller.dateInput,
                    isShow: false,
                    text: 'date',
                    type: TextInputType.text,
                    perfixIcon: const Icon(IconBroken.Calendar),
                    onTap: () => controller.datePicker(context),
                    onSubmit: (p0) {},
                    onComplete: () => FocusScope.of(context).unfocus(),
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    perfixIcon: const Icon(IconBroken.Time_Circle),
                    controller: controller.timeInput,
                    isShow: false,
                    text: 'time',
                    type: TextInputType.text,
                    onTap: () => controller.timePicker(context),
                    onSubmit: (p0) {},
                    onComplete: () => FocusScope.of(context).unfocus(),
                  ),
                  const SizedBox(height: 20),
                  CustomBottom(
                    color: const Color.fromARGB(255, 176, 210, 209),
                    onPressed: () {},
                    text: CustomText(
                      text: 'Save',
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                    ),
                    width: double.infinity,
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
