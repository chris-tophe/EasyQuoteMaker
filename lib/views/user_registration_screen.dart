import 'package:easy_quote_maker/controllers/user_registration_controller.dart';
import 'package:easy_quote_maker/services/validators.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRegistrationScreen extends StatelessWidget {

  var controller = Get.find<UserRegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Registration"),),
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: controller.validationFormKey,
              child: Column(
                children: [
                  LabeledTextInput(
                    label: "Username",
                    controller: controller.usernameController,
                    validator: Validator.isValidUsername,
                  ),
                  LabeledTextInput(
                    label: "Password",
                    controller: controller.passwordController,
                    validator: Validator.isValidPassword,
                    obscure: true,
                  ),
                  LabeledTextInput(
                    label: "Password\nConfirmation",
                    controller: controller.passwordConfirmController,
                    validator: (val) {
                      var s = Validator.isSame(val, controller.passwordController.text);
                      if (s != null)return s.toString();
                      return null;
                    },
                    obscure: true,
                  ),
                  LabeledTextInput(
                    label: "First Name",
                    controller: controller.firstNameController,
                    validator: Validator.isNotEmpty,
                  ),
                  LabeledTextInput(
                    label: "Last Name",
                    controller: controller.lastNameController,
                    validator: Validator.isNotEmpty,
                  ),
                  LabeledTextInput(
                    label: "Email",
                    controller: controller.emailController,
                    validator: Validator.isValidEmail,
                  ),
                  MaterialButton(
                    child: Text("Register"),
                    onPressed: controller.registerUser
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}