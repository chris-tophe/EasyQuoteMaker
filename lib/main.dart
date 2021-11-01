import 'package:easy_quote_maker/configuration/initial_binding.dart';
import 'package:easy_quote_maker/configuration/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Easy Quote Maker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: LoginScreen(),
      initialRoute: '/login',
      initialBinding: InitialBinding(),
      getPages: Routes.getPages,
    );
  }
}
