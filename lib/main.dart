import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hobit_app/core/services/settings/settingsServices.dart';
import 'package:hobit_app/core/services/themes/darkTheme.dart';
import 'package:hobit_app/core/services/themes/lightTheme.dart';
import 'package:hobit_app/routes/routes.dart';
import 'package:hobit_app/util/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservices();
  runApp(const MyApp());
}

Future initservices() async {
  await Get.putAsync(() => SettingsServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: LightTheme().customLightTheme,
      darkTheme: DarkTheme().customDarkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
