

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hobit_app/core/services/settings/settingsServices.dart';
import 'package:hobit_app/routes/routes.dart';

class AuthMiddleWare extends GetMiddleware {
  var shared = Get.put(SettingsServices());

  @override
  RouteSettings? redirect(String? route) {
    if (shared.sharedPreferences!.getString('token') != null) {
      return  RouteSettings(name: AppRoutes.home);
    } else if (shared.sharedPreferences!.getBool('token') == false) {
      return  RouteSettings(name: AppRoutes.login);
    }
    return null;
    // return RouteSettings(name: AppRoutes.login);
  }
}
