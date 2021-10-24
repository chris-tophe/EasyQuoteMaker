import 'dart:convert';

import 'package:easy_quote_maker/models/request_token_user.dart';
import 'package:easy_quote_maker/models/token_storage.dart';
import 'package:easy_quote_maker/proxy/proxy_factory.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void getlastLoggedUser() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey("user")) {
      String s = pref.getString('user');
      Map<String, dynamic> js = jsonDecode(s);
      RequestTokenUser lastLoggedUser = RequestTokenUser.fromJson(js);
      usernameTextController.text = lastLoggedUser.username;
      passwordTextController.text = lastLoggedUser.password;
    }
  }

  void login() async {
    if (formKey.currentState.validate()) {
      final tokenProxy = ProxyFactory.createTokenProxy();
      RequestTokenUser user = RequestTokenUser(
          usernameTextController.text, passwordTextController.text);
      tokenProxy.requestTokenUser = user;
      await tokenProxy.fetchToken();
      if (TokenStorage.instance.token != null &&
          TokenStorage.instance.token.isNotEmpty) {
        Get.toNamed('userScreen');
      }
    }
  }
}