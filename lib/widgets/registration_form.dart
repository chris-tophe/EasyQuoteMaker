import 'package:easy_quote_maker/component/validators.dart';
import 'package:easy_quote_maker/widgets/labeled_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            child: Column(
              children: [
                LabeledTextInput(
                  label: "Username",
                  controller: usernameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Password",
                  controller: passwordController,
                  validator: Validator.isValidPassword,
                ),
                LabeledTextInput(
                  label: "Password\nConfirmation",
                  controller: passwordController,
                  validator: Validator.isValidPassword,
                ),
                LabeledTextInput(
                  label: "First Name",
                  controller: firstNameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Last Name",
                  controller: lastNameController,
                  validator: Validator.isNotEmpty,
                ),
                LabeledTextInput(
                  label: "Email",
                  controller: emailController,
                  validator: Validator.isNotEmpty,
                ),
                MaterialButton(
                  child: Text("Register"),
                  onPressed: (){

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
