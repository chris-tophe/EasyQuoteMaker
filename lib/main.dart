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
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => UserRegistrationScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
