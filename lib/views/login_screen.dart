import 'package:easy_quote_maker/controllers/login_controller.dart';
import 'package:easy_quote_maker/services/validators.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EasyQuoteMaker"),
      ),
      body: Container(
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
                children: [
                  LabeledTextInput(
                    label: "Username",
                    controller: controller.usernameTextController,
                    validator: Validator.isNotEmpty,
                  ),
                  LabeledTextInput(
                    label: "Password",
                    controller: controller.passwordTextController,
                    validator: Validator.isValidPassword,
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text('Login'),
                    onPressed: () => controller.login(),
                  ),
                  MaterialButton(
                      child: Text("Register"),
                      onPressed: () async {
                        await Get.toNamed("registerScreen");

                      })
                ]
            ),
          ),
        ),
      ),
    );
  }
}