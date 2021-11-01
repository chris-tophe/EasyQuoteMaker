import 'package:easy_quote_maker/controllers/user_controller.dart';
import 'package:easy_quote_maker/models/role.dart';
import 'package:easy_quote_maker/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  final controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EasyQuoteMaker")),
      body: Center(
        child: Column(children: [
          Row(
            children: [
              Text("Login"),
              Obx(() => Text(controller.user$.value.username)),
            ],
          ),
          Row(
            children: [
              Text("Email"),
              Obx(() => Text(controller.user$.value.email))
            ],
          ),
          Row(
            children: [
              Text("Prenom"),
              Obx(() => Text(controller.user$.value.firstName))
            ],
          ),
          Row(
            children: [
              Text("Nom"),
              Obx(() => Text(controller.user$.value.lastName))
            ],
          ),
          Row(
            children: [
              Text("Manager"),
              Obx(() => Text(controller.user$.value.userManager?.username ?? "Pas de Manager"))
            ],
          ),
          Row(
            children: [
              Text("Role"),
              Obx(() => _drawRoles(controller.user$.value.roles))
            ],
          ),
        ]),
      ),
    );
  }

  Widget _drawRoles(List<Role> roles) {
    return Column(
        children: List<Widget>.generate(roles.length, (int index) {
      return Text(describeEnum(roles[index]));
    }));
  }
}
