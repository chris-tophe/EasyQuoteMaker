import 'package:easy_quote_maker/controllers/login_controller.dart';
import 'package:easy_quote_maker/controllers/user_controller.dart';
import 'package:easy_quote_maker/controllers/user_registration_controller.dart';
import 'package:easy_quote_maker/views/login_screen.dart';
import 'package:easy_quote_maker/views/user_registration_screen.dart';
import 'package:easy_quote_maker/views/user_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final getPages = [
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put<LoginController>(LoginController());
      }),
    ),
    GetPage(
      name: '/userScreen',
      page: () => UserScreen(),
      binding: BindingsBuilder(() {
        Get.put<UserController>(UserController());
      }),
    ),
    GetPage(
      name: '/registerScreen',
      page: () => UserRegistrationScreen(),
      binding: BindingsBuilder(() {
        Get.put<UserRegistrationController>(UserRegistrationController());
      }),
    ),
  ];
}
