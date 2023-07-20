// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hobit_app/core/services/network/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsServices extends GetxService {
  SharedPreferences? sharedPreferences;

  Future<SettingsServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Dio_Helper.init();
    return this;
  }
}
