import 'package:get/get.dart';
import 'package:hobit_app/core/view_model/add_habit_view_model.dart';
import 'package:hobit_app/core/view_model/home_view_model.dart';
import 'package:hobit_app/core/view_model/login_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddHabitViewModel());
    Get.lazyPut(() => LoginViewModel());
    Get.lazyPut(() => HomeViewModel());
  }

}