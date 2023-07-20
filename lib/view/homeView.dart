// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hobit_app/core/view_model/home_view_model.dart';
import 'package:hobit_app/routes/routes.dart';
import 'package:hobit_app/view/widget/Text.dart';
import 'package:hobit_app/view/widget/icon_broken.dart';
import 'package:intl/intl.dart';

class HomeView extends GetWidget<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(builder: (con) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/person.png'),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        IconBroken.Plus,
                        size: 30,
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.addHabit);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        IconBroken.Notification,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                CustomText(
                  text: 'Yousef',
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: 'Today\'s Habit',
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                DatePicker(
                  DateTime.now(),
                  height: MediaQuery.of(context).size.height * .11,
                  selectionColor: const Color.fromARGB(255, 176, 210, 209),
                  initialSelectedDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    con.changeTime(selectedDate);
                    // print(DateFormat('yyyy-MM-dd').format(controller.select!));
                  },
                  dayTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  monthTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  dateTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomText(
                      text: 'Today\'s Schedule',
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: CustomText(
                        text: 'See All',
                        textStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                DateTime.now().day == con.select!.day
                    ? Expanded(
                        child: con.isLoading.value
                            ? const Center(
                                child: CupertinoActivityIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  // print("Select ${con.select!.day}");
                                  // print(DateTime.now().day);
                                  return _buildContainer(
                                      context, index, con.hobbyModel[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: con.hobbyModel.length,
                              ),
                      )
                    : Container(
                        child: CustomText(text: "Good Work"),
                      )
              ],
            ),
          ),
        );
      }),
    );
  }

  _buildContainer(context, index, model) => Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .16,
        decoration: BoxDecoration(
          color: index == 0
              ? const Color.fromARGB(255, 176, 210, 206)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Center(
                  child: CustomText(
                    text: DateFormat("h:mm a").format(DateTime.now()),
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: model.hobby!,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black87,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  CustomText(
                    text: model.note!,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
