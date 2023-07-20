import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hobit_app/constant.dart';
import 'package:hobit_app/core/services/network/dio_helper.dart';
import 'package:hobit_app/core/services/settings/settingsServices.dart';
import 'package:hobit_app/model/login_model.dart';
import 'package:hobit_app/routes/routes.dart';

class LoginViewModel extends GetxController {
  bool isShow = true;
  RxBool isLoading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SettingsServices services = Get.put(SettingsServices());

  void changeShow() {
    isShow = !isShow;
    update();
  }

  LoginModel? loginModel;
  void loginMethod() {
    try {
      isLoading.value = true;
      Dio_Helper.postData(url: 'user/login', data: {
        'username': usernameController.text,
        'password': passwordController.text,
      }).then((value) {
        isLoading.value = false;
        if (kDebugMode) {
          print(value!.data);
        }
        if (value.statusCode == 401) {
          Get.snackbar(
              'erorr',
              value!.data
                  .toString()
                  .replaceAll('{error:', '')
                  .replaceAll('}', ''));
        } else {
          loginModel = LoginModel.fromJson(value.data);
          token = loginModel!.access_token!;
          services.sharedPreferences!.setString('token', token);
          Get.offAllNamed(AppRoutes.home);
        }
        update();
      });
      update();
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('erorr', e.toString());
      update();
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
