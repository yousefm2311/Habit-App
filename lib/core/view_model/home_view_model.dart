import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hobit_app/core/services/network/dio_helper.dart';
import 'package:hobit_app/core/services/settings/settingsServices.dart';
import 'package:hobit_app/endPoint.dart';
import 'package:hobit_app/model/home_model.dart';

class HomeViewModel extends GetxController {
  SettingsServices settingsServices = Get.put(SettingsServices());
  HomeViewModel() {
    fetchData();
  }
  DateTime? select = DateTime.now();
  void changeTime(time) {
    select = time;
    if (kDebugMode) {
      print(select!.day.toString());
    }
    update();
  }

  RxBool isLoading = false.obs;
  List<dynamic> item = [];
  List<HobbyModel> hobbyModel = [];
  void fetchData() {
    try {
      isLoading.value = true;
      Dio_Helper.getData(
        url: hobby,
        api_key: settingsServices.sharedPreferences!.getString('token'),
      ).then((value) {
        if (kDebugMode) {
          print(value.data);
        }
        item = value.data;
        for (int i = 0; i < item.length; i++) {
          hobbyModel.add(HobbyModel.fromJson(item[i]));
        }
        if (kDebugMode) {
          print(hobbyModel[1].daysOfHobby!);
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
