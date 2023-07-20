import 'package:get/get.dart';
import 'package:hobit_app/core/middleware/middleware.dart';
import 'package:hobit_app/util/binding.dart';
import 'package:hobit_app/view/addHabit.dart';
import 'package:hobit_app/view/homeView.dart';
import 'package:hobit_app/view/loginView.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomeView(),
    ),
    GetPage(
        name: addHabit, page: () => const AddHabit(), bindings: [Binding()]),
    GetPage(
      name: login,
      page: () => const LoginView(),
      bindings: [Binding()],
      middlewares: [AuthMiddleWare()] 
    ),
  ];

  static String home = '/home';
  static String addHabit = '/addHabit';
  static String login = '/login';
}
