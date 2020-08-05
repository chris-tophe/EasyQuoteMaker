import 'package:easy_quote_maker/interfaces/jsonable.dart';
import 'package:easy_quote_maker/model/role.dart';
import 'package:flutter/foundation.dart';

class User implements JSONable {
  int _id;
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _username = "";
  User _userManager;
  List<Role> _roles = List<Role>();

  User();

  @override
  User.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _email = json["email"];
    _password = json["password"];
    _username = json["username"];
    if (json["userManager"] != null)
      _userManager = User.fromJson(json["userManager"]);
    List l = List.of(json["roles"]);
    l.forEach((string) {
      Role.values.forEach((role) {
        if (describeEnum(role) == string) _roles.add(role);
      });
    });
  }

  @override
  Map<String, dynamic> toJson() {
    return {
    "firstName": _firstName,
    "lastName": _lastName,
    "email": _email,
    "password": _password,
    "username": _username
    };
  }

  List<Role> get roles => _roles;

  set roles(List<Role> value) {
    _roles = value;
  }

  User get userManager => _userManager;

  set userManager(User value) {
    _userManager = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  @override
  User cloneFromJson(Map<String, dynamic> json) {
    return new User.fromJson(json);
  }
}
