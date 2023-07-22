import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hobit_app/core/services/network/dio_helper.dart';
import 'package:hobit_app/core/services/settings/settingsServices.dart';
import 'package:hobit_app/endPoint.dart';
import 'package:intl/intl.dart';

class AddHabitViewModel extends GetxController {
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  datePicker(context) async {
    try {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        dateInput.text = formattedDate;
      } else {
        if (kDebugMode) {
          print("Please select a date");
        }
      }
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  TimeOfDay? time;

  timePicker(context) async {
    try {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 12, minute: 00),
        initialEntryMode: TimePickerEntryMode.input,
      );
      if (pickedTime != null) {
        time = pickedTime;
        timeInput.text = time!.format(context).toString();
      } else {
        if (kDebugMode) {
          print("Please select a date");
        }
      }
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  RxBool isLoading = false.obs;
  SettingsServices settingsServices = Get.put(SettingsServices());
  void addHabit() {
    try {
      isLoading.value = true;
      Dio_Helper.postData(
        url: hobby,
        api_key: settingsServices.sharedPreferences!.getString('token'),
        data: {
          'hobby': titleController.text,
          'note': noteController.text,
          'days_of_hobby': [
            dateInput.text.toString(),
          ]
        },
      ).then((value) {
        if (kDebugMode) {
          print(value.data);
        }
        isLoading.value = false;
        update();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading.value = false;
      update();
    }
  }
}
