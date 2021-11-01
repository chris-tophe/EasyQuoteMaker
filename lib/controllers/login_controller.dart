import 'package:easy_quote_maker/exceptions/not_logged_exception.dart';
import 'package:easy_quote_maker/models/response_token.dart';
import 'package:easy_quote_maker/services/alert_factory.dart';
import 'package:easy_quote_maker/services/auth_service.dart';
import 'package:easy_quote_maker/services/logger.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _authService = Get.find<AuthService>();

  void login() async {
    try {
      await _authService.logIn(
          usernameTextController.text, passwordTextController.text);
      if (_authService.isLogged) {
        Get.toNamed('/userScreen');
      }
    } on NotLoggedException {
      AlertFactory.alertWrong(Get.context);
    }
  }
}
