import 'package:equatable/equatable.dart';


class RequestTokenUser extends Equatable {
  String _username;
  String _password;

  RequestTokenUser(this._username, this._password);

  RequestTokenUser.fromJson(Map<String, dynamic> json) {
    _username = json["username"];
    _password = json["password"];
  }

  String get username => _username;

  String get password => _password;

  Map<String, dynamic> toJson() {
    return {"username": _username, "password": _password};
  }

  @override
  List<Object> get props => [_username , _password];
}
