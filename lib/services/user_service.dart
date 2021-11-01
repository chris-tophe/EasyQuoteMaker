import 'package:easy_quote_maker/configuration/server_address.dart';
import 'package:easy_quote_maker/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserService extends GetConnect{

  final sharedPreferences = GetStorage();

  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => User.fromJson(val as Map<String, dynamic>);
    httpClient.addRequestModifier((request) {
      var token = sharedPreferences.read('token');
      request.headers['Authorization'] = 'Bearer ' + token ;
      return request;
    });
  }

  Future<Response<User>> getCurrentUser() => get(ServerAddress.USER,);
  Future<Response<User>> createUser(User user) => post(ServerAddress.USER, user.toJson());
}