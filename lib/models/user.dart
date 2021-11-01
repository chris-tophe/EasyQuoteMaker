import 'package:easy_quote_maker/models/role.dart';
import 'package:flutter/foundation.dart';

class User {
  int id;

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String username = "";
  User userManager;
  List<Role> roles = [Role.UNDEFINED];

  User({
    this.id,
    this.firstName="",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.username = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var u = User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        username: json["username"]);
    // warning recursion can be a problem if a lot of levels
    if (json["userManager"] != null) {
      u.userManager = User.fromJson(json["userManager"]);
    }
    if (json["roles"] != null) {
      List l = List.of(json["roles"]);
      if (l.length > 0){
        u.roles = [];
      }
      l.forEach((string) {
        Role.values.forEach((role) {
          if (describeEnum(role) == string) u.roles.add(role);
        });
      });
    }
    return u;
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "username": username
    };
  }
}
