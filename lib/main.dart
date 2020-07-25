import 'package:easy_quote_maker/views/login_screen.dart';
import 'package:easy_quote_maker/views/user_registration_screen.dart';
import 'package:easy_quote_maker/views/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Easy Quote Maker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: LoginScreen(),
        initialRoute: 'login',
        routes: {
          'login': (context) => LoginScreen(),
          'userScreen': (context) => UserScreen(),
          'registerScreen' : (context) => UserRegistrationScreen()
        });
  }
}
