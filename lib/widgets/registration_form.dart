import 'package:easy_quote_maker/component/alert_factory.dart';
import 'package:easy_quote_maker/component/validators.dart';

import 'package:easy_quote_maker/model/user.dart';
import 'package:easy_quote_maker/proxy/proxy_factory.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _validationFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "bobChapentier";
    _passwordController.text = "bobbob";
    _firstNameController.text = "Bob";
    _lastNameController.text = "Le Charpentier";
    _emailController.text = "bob@bob.com";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _validationFormKey,
            child: Column(
              children: [
                LabeledTextInput(
                  label: "Username",
                  controller: _usernameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Password",
                  controller: _passwordController,
                  validator: Validator.isValidPassword,
                ),
                LabeledTextInput(
                  label: "Password\nConfirmation",
                  controller: _passwordController,
                  validator: Validator.isValidPassword,
                ),
                LabeledTextInput(
                  label: "First Name",
                  controller: _firstNameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Last Name",
                  controller: _lastNameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Email",
                  controller: _emailController,
                  validator: Validator.isNotEmpty,
                ),
                MaterialButton(
                  child: Text("Register"),
                  onPressed: () async {
                    if (_validationFormKey.currentState.validate()) {
                      final userProxy = ProxyFactory.createUserProxy();
                      final user = User();
                      user.firstName = _firstNameController.text;
                      user.lastName = _lastNameController.text;
                      user.username = _lastNameController.text;
                      user.email = _emailController.text;
                      user.password = _passwordController.text;
                      User createdUser = await userProxy.post(user);
                      if (createdUser?.username == user.username) {
                        Navigator.pop(context, createdUser);
                      } else {
                        AlertFactory.alertWrong(context);
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
