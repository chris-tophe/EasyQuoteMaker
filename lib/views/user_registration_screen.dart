import 'package:easy_quote_maker/widgets/registration_form.dart';
import 'package:flutter/material.dart';

class UserRegistrationScreen extends StatefulWidget {
  UserRegistrationScreen({Key key}) : super(key: key);

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Registration"),),
      body:RegistrationForm()
    );
  }
}