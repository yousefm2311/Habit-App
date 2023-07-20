import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddHabitViewModel extends GetxController {
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();




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
}
