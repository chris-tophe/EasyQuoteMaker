import 'dart:convert';

import 'package:easy_quote_maker/services/alert_factory.dart';
import 'package:easy_quote_maker/services/validators.dart';
import 'package:easy_quote_maker/models/request_token_user.dart';
import 'package:easy_quote_maker/models/user.dart';
import 'package:easy_quote_maker/proxy/proxy_factory.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _validationFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "korben.dallas";
    _passwordController.text = "multipass";
    _passwordConfirmController.text = "multipass";
    _firstNameController.text = "Korben";
    _lastNameController.text = "Dallas";
    _emailController.text = "korben.dallas@nycity.com";
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
                  validator: Validator.isValidUsername,
                ),
                LabeledTextInput(
                  label: "Password",
                  controller: _passwordController,
                  validator: Validator.isValidPassword,
                  obscure: true,
                ),
                LabeledTextInput(
                  label: "Password\nConfirmation",
                  controller: _passwordConfirmController,
                  validator: (val) {
                    var s = Validator.isSame(val, _passwordController.text);
                    if (s != null)return s.toString();
                    return null;
                  },
                  obscure: true,
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
                  validator: Validator.isValidEmail,
                ),
                MaterialButton(
                  child: Text("Register"),
                  onPressed: () async {
                    if (_validationFormKey.currentState.validate()) {
                      final userProxy = ProxyFactory.createUserProxy();
                      final user = User();
                      user.firstName = _firstNameController.text;
                      user.lastName = _lastNameController.text;
                      user.username = _usernameController.text;
                      user.email = _emailController.text;
                      user.password = _passwordController.text;
                      User createdUser = await userProxy.post(user);
                      if (createdUser != null) createdUser.password = user.password;
                      if (createdUser?.username == user.username) {
                        final pref = await SharedPreferences.getInstance();
                        Map<String,dynamic> js = RequestTokenUser(createdUser.username,createdUser.password).toJson();
                        pref.setString("user",json.encode(js));
                        Navigator.pop(context);
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
