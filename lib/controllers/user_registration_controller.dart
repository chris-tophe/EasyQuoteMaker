import 'package:easy_quote_maker/models/user.dart';
import 'package:easy_quote_maker/services/alert_factory.dart';
import 'package:easy_quote_maker/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserRegistrationController extends GetxController{

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final validationFormKey = GlobalKey<FormState>();

  var userService = Get.find<UserService>();


  @override
  void onInit() {
    usernameController.text = "korben.d";
    passwordController.text = "multipass";
    passwordConfirmController.text = "multipass";
    firstNameController.text = "Korben";
    lastNameController.text = "Dallas";
    emailController.text = "korben.dallas@nycity.com";
  }

  void registerUser() async {
    if (validationFormKey.currentState.validate()) {
      final user = User();
      user.firstName = firstNameController.text;
      user.lastName = lastNameController.text;
      user.username = usernameController.text;
      user.email = emailController.text;
      user.password = passwordController.text;
      final response = await userService.createUser(user);
      if (response.isOk){
        Get.back();
      }
      if (response.hasError){
        AlertFactory.alertWrong(Get.context);
      }
    }
  }
}